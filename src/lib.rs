#![no_std]
#![allow(improper_ctypes)]

use libc_print::std_name::println;

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}

#[no_mangle]
pub unsafe extern "C" fn add_numbers(a: i64, b: i64) -> i64 {
    println!("Adding {} and {}", a, b);
    a + b
}

#[no_mangle]
pub unsafe extern "C" fn process_bytes(data: *const u8, len: usize) -> i64 {
    if data.is_null() {
        return -1;
    }
    let slice = core::slice::from_raw_parts(data, len);
    slice.iter().map(|&x| x as i64).sum()
}
