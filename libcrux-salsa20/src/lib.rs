//! # Salsa20
//!
//! A Salsa implementation

#![no_std]
#![forbid(unsafe_code)]
#![warn(clippy::arithmetic_side_effects)]
#![deny(missing_docs)]

/// Salsa20 quarterround function.
/// Takes four 32-bit words and returns the four 32-bit words resulting from the application of quarterround.
fn quarterround (y0 : u32, y1 : u32, y2 : u32, y3 : u32) -> (u32, u32, u32, u32)
{
    /*
        According to the spec '+' is addition mod 2^32, so we use wrapping_add
    */
    let z1 = y1 ^ y0.wrapping_add(y3).rotate_left(7);
    let z2 = y2 ^ z1.wrapping_add(y0).rotate_left(9);
    let z3 = y3 ^ z2.wrapping_add(z1).rotate_left(13);
    let z0 = y0 ^ z3.wrapping_add(z2).rotate_left(18);

    (z0, z1, z2, z3)
}
