module Libcrux_salsa20
#set-options "--fuel 0 --ifuel 1 --z3rlimit 15"
open Core
open FStar.Mul

/// Salsa20 quarterround function.
/// Takes four 32-bit words and returns the four 32-bit words resulting from the application of quarterround.
let quarterround (y0 y1 y2 y3: u32) : (u32 & u32 & u32 & u32) =
  let z1:u32 =
    y1 ^.
    (Core.Num.impl__u32__rotate_left (Core.Num.impl__u32__wrapping_add y0 y3 <: u32) 7ul <: u32)
  in
  let z2:u32 =
    y2 ^.
    (Core.Num.impl__u32__rotate_left (Core.Num.impl__u32__wrapping_add z1 y0 <: u32) 9ul <: u32)
  in
  let z3:u32 =
    y3 ^.
    (Core.Num.impl__u32__rotate_left (Core.Num.impl__u32__wrapping_add z2 z1 <: u32) 13ul <: u32)
  in
  let z0:u32 =
    y0 ^.
    (Core.Num.impl__u32__rotate_left (Core.Num.impl__u32__wrapping_add z3 z2 <: u32) 18ul <: u32)
  in
  z0, z1, z2, z3 <: (u32 & u32 & u32 & u32)
