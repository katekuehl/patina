use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_start_native(port_: i64, storage_path: *mut wire_uint_8_list) {
    wire_start_native_impl(port_, storage_path)
}

#[no_mangle]
pub extern "C" fn wire_get_my_stations(port_: i64) {
    wire_get_my_stations_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_authenticate_portal(
    port_: i64,
    email: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
) {
    wire_authenticate_portal_impl(port_, email, password)
}

#[no_mangle]
pub extern "C" fn wire_validate_tokens(port_: i64, tokens: *mut wire_Tokens) {
    wire_validate_tokens_impl(port_, tokens)
}

#[no_mangle]
pub extern "C" fn wire_start_download(port_: i64, device_id: *mut wire_uint_8_list) {
    wire_start_download_impl(port_, device_id)
}

#[no_mangle]
pub extern "C" fn wire_start_upload(port_: i64, device_id: *mut wire_uint_8_list) {
    wire_start_upload_impl(port_, device_id)
}

#[no_mangle]
pub extern "C" fn wire_rust_release_mode(port_: i64) {
    wire_rust_release_mode_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_create_log_sink(port_: i64) {
    wire_create_log_sink_impl(port_)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_tokens_0() -> *mut wire_Tokens {
    support::new_leak_box_ptr(wire_Tokens::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Tokens> for *mut wire_Tokens {
    fn wire2api(self) -> Tokens {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Tokens>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Tokens> for wire_Tokens {
    fn wire2api(self) -> Tokens {
        Tokens {
            token: self.token.wire2api(),
            transmission: self.transmission.wire2api(),
        }
    }
}
impl Wire2Api<TransmissionToken> for wire_TransmissionToken {
    fn wire2api(self) -> TransmissionToken {
        TransmissionToken {
            token: self.token.wire2api(),
            url: self.url.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_Tokens {
    token: *mut wire_uint_8_list,
    transmission: wire_TransmissionToken,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_TransmissionToken {
    token: *mut wire_uint_8_list,
    url: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_Tokens {
    fn new_with_null_ptr() -> Self {
        Self {
            token: core::ptr::null_mut(),
            transmission: Default::default(),
        }
    }
}

impl Default for wire_Tokens {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_TransmissionToken {
    fn new_with_null_ptr() -> Self {
        Self {
            token: core::ptr::null_mut(),
            url: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_TransmissionToken {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
