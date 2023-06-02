import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'gen/ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'dispatcher.dart';

class StationModel {
  final String deviceId;
  StationConfig? config;
  SyncingProgress? syncing;
  bool connected;
  bool busy;

  StationModel({
    required this.deviceId,
    this.config,
    this.connected = false,
    this.busy = false,
  });
}

class KnownStationsModel extends ChangeNotifier {
  final Map<String, StationModel> _stations = {};

  UnmodifiableListView<StationModel> get stations => UnmodifiableListView(_stations.values);

  KnownStationsModel(Native api, AppEventDispatcher dispatcher) {
    dispatcher.addListener<DomainMessage_NearbyStations>((nearby) {
      final byDeviceId = {};
      for (var station in nearby.field0) {
        findOrCreate(station.deviceId);
        byDeviceId[station.deviceId] = station;
      }
      for (var station in _stations.values) {
        final nearby = byDeviceId[station.deviceId];
        station.connected = nearby != null;
        station.busy = nearby?.busy;
      }
      notifyListeners();
    });

    dispatcher.addListener<DomainMessage_StationRefreshed>((refreshed) {
      final station = findOrCreate(refreshed.field0.deviceId);
      station.config = refreshed.field0;
      station.connected = true;
      notifyListeners();
    });

    dispatcher.addListener<DomainMessage_TransferProgress>((transferProgress) {
      applyTransferProgress(transferProgress.field0);
    });

    _load();
  }

  void applyTransferProgress(TransferProgress transferProgress) {
    final deviceId = transferProgress.deviceId;
    final station = findOrCreate(deviceId);
    final status = transferProgress.status;

    station.connected = true;
    if (status is TransferStatus_Starting) {
      station.syncing = SyncingProgress(progress: null);
    }
    if (status is TransferStatus_Transferring) {
      station.syncing = SyncingProgress(progress: status.field0);
    }
    if (status is TransferStatus_Completed) {
      station.syncing = null;
    }
    if (status is TransferStatus_Failed) {
      station.syncing = SyncingProgress(progress: null);
    }

    notifyListeners();
  }

  void _load() async {
    var stations = await api.getMyStations();
    debugPrint("(load) my-stations: $stations");
    for (var station in stations) {
      findOrCreate(station.deviceId).config = station;
    }
    notifyListeners();
  }

  StationModel? find(String deviceId) {
    return _stations[deviceId];
  }

  StationModel findOrCreate(String deviceId) {
    _stations.putIfAbsent(deviceId, () => StationModel(deviceId: deviceId));
    return _stations[deviceId]!;
  }

  Future<void> startDownload({required String deviceId}) async {
    final station = find(deviceId);
    if (station == null) {
      debugPrint("$deviceId station missing");
      return;
    }

    if (station.syncing != null) {
      debugPrint("$deviceId already syncing");
      return;
    }

    final progress = await api.startDownload(deviceId: deviceId);
    applyTransferProgress(progress);
  }

  Future<void> startUpload({required String deviceId}) async {
    final station = find(deviceId);
    if (station == null) {
      debugPrint("$deviceId station missing");
      return;
    }

    if (station.syncing != null) {
      debugPrint("$deviceId already syncing");
      return;
    }

    final progress = await api.startUpload(deviceId: deviceId);
    applyTransferProgress(progress);
  }

  ModuleConfig? findModule(ModuleIdentity moduleIdentity) {
    for (final station in stations) {
      final config = station.config;
      if (config != null) {
        for (final module in config.modules) {
          if (module.identity == moduleIdentity) {
            return module;
          }
        }
      }
    }
    return null;
  }
}

class AppState {
  final Native api;
  final AppEventDispatcher dispatcher;
  final KnownStationsModel knownStations;
  final PortalAccounts portalAccounts;

  AppState._(this.api, this.dispatcher, this.knownStations, this.portalAccounts);

  static AppState build(Native api, AppEventDispatcher dispatcher) {
    return AppState._(api, dispatcher, KnownStationsModel(api, dispatcher), PortalAccounts(api: api, accounts: List.empty()));
  }
}

class AppEnv {
  AppEventDispatcher dispatcher;
  ValueNotifier<AppState?> _appState;

  AppEnv._(this.dispatcher, {AppState? appState}) : _appState = ValueNotifier(appState);

  AppEnv.appState(AppEventDispatcher dispatcher)
      : this._(
          dispatcher,
          appState: AppState.build(api, dispatcher),
        );

  ValueListenable<AppState?> get appState => _appState;
}

class SyncingProgress extends ChangeNotifier {
  final DownloadProgress? progress;

  SyncingProgress({this.progress});
}

class ModuleIdentity {
  final String moduleId;

  ModuleIdentity({required this.moduleId});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModuleIdentity && other.moduleId == moduleId;
  }

  @override
  int get hashCode => moduleId.hashCode;
}

extension Identity on ModuleConfig {
  ModuleIdentity get identity => ModuleIdentity(moduleId: moduleId);

  SensorConfig? get calibrationSensor {
    if (key.startsWith("modules.water")) {
      return sensors[0];
    }
    return null;
  }
}

extension PortalTransmissionTokens on TransmissionToken {
  Map<String, dynamic> toJson() => {
        'token': token,
        'url': url,
      };

  static TransmissionToken fromJson(Map<String, dynamic> data) {
    final token = data['token'] as String;
    final url = data['url'] as String;

    return TransmissionToken(token: token, url: url);
  }
}

extension PortalTokens on Tokens {
  Map<String, dynamic> toJson() => {
        'token': token,
        'transmission': transmission.toJson(),
      };

  static Tokens fromJson(Map<String, dynamic> data) {
    final token = data['token'] as String;
    final transmissionData = data['transmission'] as Map<String, dynamic>;
    final transmission = PortalTransmissionTokens.fromJson(transmissionData);

    return Tokens(token: token, transmission: transmission);
  }
}

enum Validity {
  unknown,
  valid,
  invalid,
}

class PortalAccount extends ChangeNotifier {
  final String email;
  final String name;
  final Tokens? tokens;
  final bool active;
  final Validity valid;

  PortalAccount({required this.email, required this.name, required this.tokens, required this.active, this.valid = Validity.unknown});

  factory PortalAccount.fromJson(Map<String, dynamic> data) {
    final email = data['email'] as String;
    final name = data['name'] as String;
    final active = data['active'] as bool;
    final tokensData = data["tokens"] as Map<String, dynamic>?;
    final tokens = tokensData != null ? PortalTokens.fromJson(tokensData) : null;

    return PortalAccount(email: email, name: name, tokens: tokens, active: active);
  }

  factory PortalAccount.fromAuthenticated(Authenticated authenticated) {
    return PortalAccount(
        email: authenticated.email, name: authenticated.name, tokens: authenticated.tokens, active: true, valid: Validity.valid);
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'tokens': tokens?.toJson(),
        'active': active,
      };

  PortalAccount invalid() {
    return PortalAccount(email: email, name: name, tokens: null, active: active, valid: Validity.invalid);
  }

  PortalAccount withActive(bool active) {
    return PortalAccount(email: email, name: name, tokens: tokens, active: active, valid: valid);
  }
}

class PortalAccounts extends ChangeNotifier {
  final Native api;
  final List<PortalAccount> _accounts = List.empty(growable: true);

  UnmodifiableListView<PortalAccount> get accounts => UnmodifiableListView(_accounts);

  PortalAccount? get active => _accounts.where((a) => a.active).first;

  PortalAccounts({required this.api, required List<PortalAccount> accounts}) {
    _accounts.addAll(accounts);
  }

  factory PortalAccounts.fromJson(Native api, Map<String, dynamic> data) {
    final accountsData = data['accounts'] as List<dynamic>;
    final accounts = accountsData.map((accountData) => PortalAccount.fromJson(accountData)).toList();
    return PortalAccounts(api: api, accounts: accounts);
  }

  Map<String, dynamic> toJson() => {
        'accounts': _accounts.map((a) => a.toJson()).toList(),
      };

  Future<PortalAccounts> load() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: "fk.accounts");
    if (value != null) {
      try {
        // A little messy, I know.
        final loaded = PortalAccounts.fromJson(api, jsonDecode(value));
        _accounts.clear();
        _accounts.addAll(loaded.accounts);
        notifyListeners();
      } catch (e) {
        debugPrint("Exception loading accounts: $e");
      }
    }
    return this;
  }

  Future<PortalAccounts> save() async {
    const storage = FlutterSecureStorage();
    final serialized = jsonEncode(this);
    await storage.write(key: "fk.accounts", value: serialized);
    return this;
  }

  Future<PortalAccount?> authenticate(String email, String password) async {
    try {
      final authenticated = await api.authenticatePortal(email: email, password: password);
      return PortalAccount.fromAuthenticated(authenticated);
    } catch (e) {
      debugPrint("Exception authenticating: $e");
      return null;
    }
  }

  Future<PortalAccount?> addOrUpdate(String email, String password) async {
    final account = await authenticate(email, password);
    if (account != null) {
      _accounts.add(account);
      await save();
      notifyListeners();
      return account;
    } else {
      return null;
    }
  }

  Future<void> activate(PortalAccount account) async {
    final updated = _accounts.map((iter) => iter.withActive(account == iter)).toList();
    _accounts.clear();
    _accounts.addAll(updated);
    await save();
    notifyListeners();
  }

  Future<void> delete(PortalAccount account) async {
    var updated = _accounts.where((iter) => iter.email != account.email).toList();
    _accounts.clear();
    _accounts.addAll(updated);
    await save();
    notifyListeners();
  }

  Future<PortalAccounts> validate() async {
    final validating = _accounts.map((e) => e).toList();
    _accounts.clear();
    for (final iter in validating) {
      final tokens = iter.tokens;
      if (tokens != null) {
        try {
          final validatedAuthentication = await api.validateTokens(tokens: tokens);
          _accounts.add(PortalAccount.fromAuthenticated(validatedAuthentication));
        } catch (e) {
          _accounts.add(iter.invalid());
        }
      }
    }
    await save();
    notifyListeners();
    return this;
  }
}
