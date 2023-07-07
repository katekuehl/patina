// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.2.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.io.dart'
    if (dart.library.html) 'bridge_generated.web.dart';

class NativeImpl implements Native {
  final NativePlatform _platform;
  factory NativeImpl(ExternalLibrary dylib) =>
      NativeImpl.raw(NativePlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory NativeImpl.wasm(FutureOr<WasmModule> module) =>
      NativeImpl(module as ExternalLibrary);
  NativeImpl.raw(this._platform);
  Stream<DomainMessage> startNative(
      {required String storagePath,
      required String portalBaseUrl,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(storagePath);
    var arg1 = _platform.api2wire_String(portalBaseUrl);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_start_native(port_, arg0, arg1),
      parseSuccessData: _wire2api_domain_message,
      constMeta: kStartNativeConstMeta,
      argValues: [storagePath, portalBaseUrl],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartNativeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_native",
        argNames: ["storagePath", "portalBaseUrl"],
      );

  Future<List<StationConfig>> getMyStations({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_my_stations(port_),
      parseSuccessData: _wire2api_list_station_config,
      constMeta: kGetMyStationsConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetMyStationsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_my_stations",
        argNames: [],
      );

  Future<Authenticated> authenticatePortal(
      {required String email, required String password, dynamic hint}) {
    var arg0 = _platform.api2wire_String(email);
    var arg1 = _platform.api2wire_String(password);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_authenticate_portal(port_, arg0, arg1),
      parseSuccessData: _wire2api_authenticated,
      constMeta: kAuthenticatePortalConstMeta,
      argValues: [email, password],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAuthenticatePortalConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "authenticate_portal",
        argNames: ["email", "password"],
      );

  Future<void> clearCalibration(
      {required String deviceId, required int module, dynamic hint}) {
    var arg0 = _platform.api2wire_String(deviceId);
    var arg1 = api2wire_usize(module);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_clear_calibration(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kClearCalibrationConstMeta,
      argValues: [deviceId, module],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kClearCalibrationConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "clear_calibration",
        argNames: ["deviceId", "module"],
      );

  Future<void> calibrate(
      {required String deviceId,
      required int module,
      required Uint8List data,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(deviceId);
    var arg1 = api2wire_usize(module);
    var arg2 = _platform.api2wire_uint_8_list(data);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_calibrate(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_unit,
      constMeta: kCalibrateConstMeta,
      argValues: [deviceId, module, data],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCalibrateConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "calibrate",
        argNames: ["deviceId", "module", "data"],
      );

  Future<Authenticated> validateTokens({required Tokens tokens, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_tokens(tokens);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_validate_tokens(port_, arg0),
      parseSuccessData: _wire2api_authenticated,
      constMeta: kValidateTokensConstMeta,
      argValues: [tokens],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kValidateTokensConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "validate_tokens",
        argNames: ["tokens"],
      );

  Future<TransferProgress> startDownload(
      {required String deviceId, dynamic hint}) {
    var arg0 = _platform.api2wire_String(deviceId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_start_download(port_, arg0),
      parseSuccessData: _wire2api_transfer_progress,
      constMeta: kStartDownloadConstMeta,
      argValues: [deviceId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartDownloadConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_download",
        argNames: ["deviceId"],
      );

  Future<TransferProgress> startUpload(
      {required String deviceId, required Tokens tokens, dynamic hint}) {
    var arg0 = _platform.api2wire_String(deviceId);
    var arg1 = _platform.api2wire_box_autoadd_tokens(tokens);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_start_upload(port_, arg0, arg1),
      parseSuccessData: _wire2api_transfer_progress,
      constMeta: kStartUploadConstMeta,
      argValues: [deviceId, tokens],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartUploadConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_upload",
        argNames: ["deviceId", "tokens"],
      );

  Future<FirmwareDownloadStatus> cacheFirmware({Tokens? tokens, dynamic hint}) {
    var arg0 = _platform.api2wire_opt_box_autoadd_tokens(tokens);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_cache_firmware(port_, arg0),
      parseSuccessData: _wire2api_firmware_download_status,
      constMeta: kCacheFirmwareConstMeta,
      argValues: [tokens],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCacheFirmwareConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "cache_firmware",
        argNames: ["tokens"],
      );

  Future<UpgradeProgress> upgradeStation(
      {required String deviceId,
      required LocalFirmware firmware,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(deviceId);
    var arg1 = _platform.api2wire_box_autoadd_local_firmware(firmware);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_upgrade_station(port_, arg0, arg1),
      parseSuccessData: _wire2api_upgrade_progress,
      constMeta: kUpgradeStationConstMeta,
      argValues: [deviceId, firmware],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kUpgradeStationConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "upgrade_station",
        argNames: ["deviceId", "firmware"],
      );

  Future<bool> rustReleaseMode({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_rust_release_mode(port_),
      parseSuccessData: _wire2api_bool,
      constMeta: kRustReleaseModeConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kRustReleaseModeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "rust_release_mode",
        argNames: [],
      );

  Stream<String> createLogSink({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_create_log_sink(port_),
      parseSuccessData: _wire2api_String,
      constMeta: kCreateLogSinkConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCreateLogSinkConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "create_log_sink",
        argNames: [],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  DateTime _wire2api_Chrono_Utc(dynamic raw) {
    return wire2apiTimestamp(ts: _wire2api_i64(raw), isUtc: true);
  }

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  Authenticated _wire2api_authenticated(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return Authenticated(
      email: _wire2api_String(arr[0]),
      name: _wire2api_String(arr[1]),
      tokens: _wire2api_tokens(arr[2]),
    );
  }

  BatteryInfo _wire2api_battery_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return BatteryInfo(
      percentage: _wire2api_f32(arr[0]),
      voltage: _wire2api_f32(arr[1]),
    );
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  DownloadProgress _wire2api_box_autoadd_download_progress(dynamic raw) {
    return _wire2api_download_progress(raw);
  }

  FirmwareDownloadStatus _wire2api_box_autoadd_firmware_download_status(
      dynamic raw) {
    return _wire2api_firmware_download_status(raw);
  }

  SensitiveConfig _wire2api_box_autoadd_sensitive_config(dynamic raw) {
    return _wire2api_sensitive_config(raw);
  }

  SensorValue _wire2api_box_autoadd_sensor_value(dynamic raw) {
    return _wire2api_sensor_value(raw);
  }

  StationConfig _wire2api_box_autoadd_station_config(dynamic raw) {
    return _wire2api_station_config(raw);
  }

  TransferProgress _wire2api_box_autoadd_transfer_progress(dynamic raw) {
    return _wire2api_transfer_progress(raw);
  }

  TransmissionConfig _wire2api_box_autoadd_transmission_config(dynamic raw) {
    return _wire2api_transmission_config(raw);
  }

  UpgradeProgress _wire2api_box_autoadd_upgrade_progress(dynamic raw) {
    return _wire2api_upgrade_progress(raw);
  }

  UploadProgress _wire2api_box_autoadd_upload_progress(dynamic raw) {
    return _wire2api_upload_progress(raw);
  }

  CapabilitiesInfo _wire2api_capabilities_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return CapabilitiesInfo(
      udp: _wire2api_bool(arr[0]),
    );
  }

  DomainMessage _wire2api_domain_message(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return DomainMessage_PreAccount();
      case 1:
        return DomainMessage_NearbyStations(
          _wire2api_list_nearby_station(raw[1]),
        );
      case 2:
        return DomainMessage_StationRefreshed(
          _wire2api_box_autoadd_station_config(raw[1]),
          _wire2api_opt_box_autoadd_sensitive_config(raw[2]),
        );
      case 3:
        return DomainMessage_TransferProgress(
          _wire2api_box_autoadd_transfer_progress(raw[1]),
        );
      case 4:
        return DomainMessage_FirmwareDownloadStatus(
          _wire2api_box_autoadd_firmware_download_status(raw[1]),
        );
      case 5:
        return DomainMessage_UpgradeProgress(
          _wire2api_box_autoadd_upgrade_progress(raw[1]),
        );
      case 6:
        return DomainMessage_AvailableFirmware(
          _wire2api_list_local_firmware(raw[1]),
        );
      default:
        throw Exception("unreachable");
    }
  }

  DownloadProgress _wire2api_download_progress(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return DownloadProgress(
      started: _wire2api_u64(arr[0]),
      completed: _wire2api_f32(arr[1]),
      total: _wire2api_usize(arr[2]),
      received: _wire2api_usize(arr[3]),
    );
  }

  double _wire2api_f32(dynamic raw) {
    return raw as double;
  }

  FirmwareDownloadStatus _wire2api_firmware_download_status(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return FirmwareDownloadStatus_Checking();
      case 1:
        return FirmwareDownloadStatus_Downloading(
          _wire2api_box_autoadd_download_progress(raw[1]),
        );
      case 2:
        return FirmwareDownloadStatus_Offline();
      case 3:
        return FirmwareDownloadStatus_Completed();
      case 4:
        return FirmwareDownloadStatus_Failed();
      default:
        throw Exception("unreachable");
    }
  }

  FirmwareInfo _wire2api_firmware_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return FirmwareInfo(
      label: _wire2api_String(arr[0]),
      time: _wire2api_i64(arr[1]),
    );
  }

  int _wire2api_i64(dynamic raw) {
    return castInt(raw);
  }

  List<LocalFirmware> _wire2api_list_local_firmware(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_local_firmware).toList();
  }

  List<ModuleConfig> _wire2api_list_module_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_module_config).toList();
  }

  List<NearbyStation> _wire2api_list_nearby_station(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_nearby_station).toList();
  }

  List<NetworkConfig> _wire2api_list_network_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_network_config).toList();
  }

  List<SensorConfig> _wire2api_list_sensor_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_sensor_config).toList();
  }

  List<StationConfig> _wire2api_list_station_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_station_config).toList();
  }

  LocalFirmware _wire2api_local_firmware(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 5)
      throw Exception('unexpected arr length: expect 5 but see ${arr.length}');
    return LocalFirmware(
      id: _wire2api_i64(arr[0]),
      label: _wire2api_String(arr[1]),
      time: _wire2api_i64(arr[2]),
      module: _wire2api_String(arr[3]),
      profile: _wire2api_String(arr[4]),
    );
  }

  ModuleConfig _wire2api_module_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 5)
      throw Exception('unexpected arr length: expect 5 but see ${arr.length}');
    return ModuleConfig(
      position: _wire2api_u32(arr[0]),
      moduleId: _wire2api_String(arr[1]),
      key: _wire2api_String(arr[2]),
      sensors: _wire2api_list_sensor_config(arr[3]),
      configuration: _wire2api_opt_uint_8_list(arr[4]),
    );
  }

  NearbyStation _wire2api_nearby_station(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return NearbyStation(
      deviceId: _wire2api_String(arr[0]),
      busy: _wire2api_bool(arr[1]),
    );
  }

  NetworkConfig _wire2api_network_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return NetworkConfig(
      ssid: _wire2api_String(arr[0]),
    );
  }

  SensitiveConfig? _wire2api_opt_box_autoadd_sensitive_config(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_sensitive_config(raw);
  }

  SensorValue? _wire2api_opt_box_autoadd_sensor_value(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_sensor_value(raw);
  }

  TransmissionConfig? _wire2api_opt_box_autoadd_transmission_config(
      dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_transmission_config(raw);
  }

  Uint8List? _wire2api_opt_uint_8_list(dynamic raw) {
    return raw == null ? null : _wire2api_uint_8_list(raw);
  }

  SensitiveConfig _wire2api_sensitive_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return SensitiveConfig(
      transmission: _wire2api_opt_box_autoadd_transmission_config(arr[0]),
      networks: _wire2api_list_network_config(arr[1]),
    );
  }

  SensorConfig _wire2api_sensor_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 6)
      throw Exception('unexpected arr length: expect 6 but see ${arr.length}');
    return SensorConfig(
      number: _wire2api_u32(arr[0]),
      key: _wire2api_String(arr[1]),
      fullKey: _wire2api_String(arr[2]),
      calibratedUom: _wire2api_String(arr[3]),
      uncalibratedUom: _wire2api_String(arr[4]),
      value: _wire2api_opt_box_autoadd_sensor_value(arr[5]),
    );
  }

  SensorValue _wire2api_sensor_value(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return SensorValue(
      time: _wire2api_Chrono_Utc(arr[0]),
      value: _wire2api_f32(arr[1]),
      uncalibrated: _wire2api_f32(arr[2]),
    );
  }

  SolarInfo _wire2api_solar_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return SolarInfo(
      voltage: _wire2api_f32(arr[0]),
    );
  }

  StationConfig _wire2api_station_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 10)
      throw Exception('unexpected arr length: expect 10 but see ${arr.length}');
    return StationConfig(
      deviceId: _wire2api_String(arr[0]),
      name: _wire2api_String(arr[1]),
      firmware: _wire2api_firmware_info(arr[2]),
      capabilities: _wire2api_capabilities_info(arr[3]),
      lastSeen: _wire2api_Chrono_Utc(arr[4]),
      meta: _wire2api_stream_info(arr[5]),
      data: _wire2api_stream_info(arr[6]),
      battery: _wire2api_battery_info(arr[7]),
      solar: _wire2api_solar_info(arr[8]),
      modules: _wire2api_list_module_config(arr[9]),
    );
  }

  StreamInfo _wire2api_stream_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return StreamInfo(
      size: _wire2api_u64(arr[0]),
      records: _wire2api_u64(arr[1]),
    );
  }

  Tokens _wire2api_tokens(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Tokens(
      token: _wire2api_String(arr[0]),
      transmission: _wire2api_transmission_token(arr[1]),
    );
  }

  TransferProgress _wire2api_transfer_progress(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return TransferProgress(
      deviceId: _wire2api_String(arr[0]),
      status: _wire2api_transfer_status(arr[1]),
    );
  }

  TransferStatus _wire2api_transfer_status(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return TransferStatus_Starting();
      case 1:
        return TransferStatus_Downloading(
          _wire2api_box_autoadd_download_progress(raw[1]),
        );
      case 2:
        return TransferStatus_Uploading(
          _wire2api_box_autoadd_upload_progress(raw[1]),
        );
      case 3:
        return TransferStatus_Processing();
      case 4:
        return TransferStatus_Completed();
      case 5:
        return TransferStatus_Failed();
      default:
        throw Exception("unreachable");
    }
  }

  TransmissionConfig _wire2api_transmission_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return TransmissionConfig(
      enabled: _wire2api_bool(arr[0]),
    );
  }

  TransmissionToken _wire2api_transmission_token(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return TransmissionToken(
      token: _wire2api_String(arr[0]),
      url: _wire2api_String(arr[1]),
    );
  }

  int _wire2api_u32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }

  UpgradeProgress _wire2api_upgrade_progress(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return UpgradeProgress(
      deviceId: _wire2api_String(arr[0]),
      status: _wire2api_upgrade_status(arr[1]),
    );
  }

  UpgradeStatus _wire2api_upgrade_status(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return UpgradeStatus_Starting();
      case 1:
        return UpgradeStatus_Uploading(
          _wire2api_box_autoadd_upload_progress(raw[1]),
        );
      case 2:
        return UpgradeStatus_Restarting();
      case 3:
        return UpgradeStatus_Completed();
      case 4:
        return UpgradeStatus_Failed();
      default:
        throw Exception("unreachable");
    }
  }

  UploadProgress _wire2api_upload_progress(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return UploadProgress(
      bytesUploaded: _wire2api_u64(arr[0]),
      totalBytes: _wire2api_u64(arr[1]),
    );
  }

  int _wire2api_usize(dynamic raw) {
    return castInt(raw);
  }
}

// Section: api2wire

@protected
int api2wire_u8(int raw) {
  return raw;
}

@protected
int api2wire_usize(int raw) {
  return raw;
}
// Section: finalizer
