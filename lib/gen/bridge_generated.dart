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

  Stream<DomainMessage> startNative({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_start_native(port_),
      parseSuccessData: _wire2api_domain_message,
      constMeta: kStartNativeConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartNativeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_native",
        argNames: [],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
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
        return DomainMessage_MyStations(
          _wire2api_list_station_config(raw[1]),
        );
      default:
        throw Exception("unreachable");
    }
  }

  List<ModuleConfig> _wire2api_list_module_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_module_config).toList();
  }

  List<NearbyStation> _wire2api_list_nearby_station(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_nearby_station).toList();
  }

  List<SensorConfig> _wire2api_list_sensor_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_sensor_config).toList();
  }

  List<StationConfig> _wire2api_list_station_config(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_station_config).toList();
  }

  ModuleConfig _wire2api_module_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return ModuleConfig(
      sensors: _wire2api_list_sensor_config(arr[0]),
    );
  }

  NearbyStation _wire2api_nearby_station(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return NearbyStation(
      deviceId: _wire2api_String(arr[0]),
    );
  }

  SensorConfig _wire2api_sensor_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 0)
      throw Exception('unexpected arr length: expect 0 but see ${arr.length}');
    return SensorConfig();
  }

  StationConfig _wire2api_station_config(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return StationConfig(
      name: _wire2api_String(arr[0]),
      generationId: _wire2api_String(arr[1]),
      modules: _wire2api_list_module_config(arr[2]),
    );
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

// Section: finalizer
