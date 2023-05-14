#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.2.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

// Section: wire functions

fn wire_rust_release_mode_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "rust_release_mode",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(rust_release_mode()),
    )
}
fn wire_create_log_sink_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "create_log_sink",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| create_log_sink(task_callback.stream_sink()),
    )
}
fn wire_start_native_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "start_native",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| start_native(task_callback.stream_sink()),
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}
// Section: impl IntoDart

impl support::IntoDart for DomainMessage {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::PreAccount => vec![0.into_dart()],
            Self::NearbyStations(field0) => vec![1.into_dart(), field0.into_dart()],
            Self::MyStations(field0) => vec![2.into_dart(), field0.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DomainMessage {}

impl support::IntoDart for ModuleConfig {
    fn into_dart(self) -> support::DartAbi {
        vec![self.sensors.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for ModuleConfig {}

impl support::IntoDart for NearbyStation {
    fn into_dart(self) -> support::DartAbi {
        vec![self.device_id.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for NearbyStation {}

impl support::IntoDart for SensorConfig {
    fn into_dart(self) -> support::DartAbi {
        Vec::<u8>::new().into_dart()
    }
}
impl support::IntoDartExceptPrimitive for SensorConfig {}

impl support::IntoDart for StationConfig {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.name.into_dart(),
            self.generation_id.into_dart(),
            self.modules.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for StationConfig {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "bridge_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
