open! Import

include Int_intf.S

val of_int : int -> t
val to_int : t -> int option

(*_ exported for Core_kernel *)
module W : sig
  val wrap_exn : int64 -> t
  val unwrap : t -> int64
end
