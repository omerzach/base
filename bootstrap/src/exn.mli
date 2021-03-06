Caml1999N018����            'exn.mli����  !  �  �  S�����*ocaml.text��&_none_A@ �A�������
   [sexp_of_t] uses a global table of sexp converters.  To register a converter for a new
    exception, add [[@@deriving sexp]] to its definition. If no suitable converter is
    found, the standard converter in [Printexc] will be used to generate an atomic
    S-expression. @��'exn.mliA@@�D@@@��A@@�D@@��A@@�D@������&Import��F �F&@@��F�F&@@��F�F&@���A�    �!t��!H(-�"H(.@@@@A�����#exn��*H(1�+H(4@@��-H(1�.H(4@@@��0H((�1H(I@@��3H((�4H(I@�����������-ocaml.warning�������#-32@@@@���Р)sexp_of_t/��@����65@5@������'Sexplib$Sexp!t>@>@>@@@//@,@,@,�����������.Pretty_printer!S��lJKS�mJKc@��oJKS�pJKc@@��    �!t��wJKn�xJKo@@@@A�����!t���JKs��JKt@@���JKs��JKt@@@���JKi��JKt@@���JKS��JKt@@���JKK��JKt@@���JKK��JKt@�����'Finally���b����b��@�������!t���b����b��@@���b����b��@@�����!t���b����b��@@���b����b��@@@@���b����b��@���)ocaml.docǐ������	� Raised when finalization after an exception failed, too.
    The first exception argument is the one raised by the initial
    function, the second exception the one raised by the finalizer. @���_����aU�@@@���_����aU�@@@���b����b��@�����(Reraised���d����d��@�������&string���d����d��@@���d����d��@@�����!t���d����d��@@���d����d��@@@@���d����d��@@���d����d��@���Р7raise_without_backtrace���g!��g8@��@����!t��g;�g<@@��	g;�
g<@@�@��g@�gA@@��g;�gA@@@���)ocaml.doc"�������	= Same as [raise], except that the backtrace is not recorded. @��f��� f�@@@��"f���#f�@@@��%g�&gA@��(g�)gA@���Р'reraise��1iCG�2iCN@��@����!t��;iCQ�<iCR@@��>iCQ�?iCR@@��@����&string��HiCV�IiC\@@��KiCV�LiC\@@�@��OiC`�PiCa@@��RiCV�SiCa@@��UiCQ�ViCa@@@@��XiCC�YiCa@��[iCC�\iCa@���Р(reraisef��du6:�eu6B@��@����!t��nu6E�ou6F@@��qu6E�ru6F@@��@����'format4��{u6h�|u6o@���!a���u6K��u6M@@�����$unit���u6O��u6S@@���u6O��u6S@@�����&string���u6U��u6[@@���u6U��u6[@@���@����$unit���u6]��u6a@@���u6]��u6a@@�@���u6e��u6f@@���u6]��u6f@@@���u6J��u6o@@��!a���u6s��u6u@@���u6J��u6u@@���u6E��u6u@@@���)ocaml.docА������	� Types with [format4] are hard to read, so here's an example.

    {[
      let foobar str =
        try
          ...
        with exn ->
          Exn.reraisef exn "Foobar is buggy on: %s" str ()
    ]}
@���kcc��t35@@@���kcc��t35@@@���u66��u6u@���u66��u6u@���Р)to_string���ww{��ww�@��@����!t���ww���ww�@@���ww���ww�@@����&string���ww���ww�@@���ww���ww�@@���ww���ww�@@@���)ocaml.doc�������= human-readable, multi-lines @��	ww��
ww�@@@��ww��ww�@@@��www�ww�@��www�ww�@���Р.to_string_mach��y���y��@��@����!t��%y���&y��@@��(y���)y��@@����&string��0y���1y��@@��3y���4y��@@��6y���7y��@@@���)ocaml.docH�������= machine format, single-line @��Ey���Fy��@@@��Hy���Iy��@@@��Ky���Ly��@��Ny���Oy��@���Р(protectx��W~dh�X~dp@���!f��@��!a��c~dv�d~dx@@��!b��i~d|�j~d~@@��l~dv�m~d~@@��@��!a��t~d��u~d�@@���'finally��@��!a���~d���~d�@@����$unit���~d���~d�@@���~d���~d�@@���~d���~d�@@��!b���~d���~d�@@���~d���~d�@@���~d���~d�@@���~ds��~d�@@@���)ocaml.doc��������	] Executes [f] and afterwards executes [finally], whether [f] throws an exception or
    not.
@���{��}ac@@@���{��}ac@@@���~dd��~d�@���~dd��~d�@���Р'protect��� @���� @��@���!f��@����$unit��� @���� @��@@��� @���� @��@@��!a��� @���� @��@@��� @���� @��@@���'finally��@����$unit��� @���� @��@@��� @���� @��@@����$unit��� @���� @��@@��� @���� @��@@��� @���� @��@@��!a��� @���� @��@@��  @��� @��@@�� @��� @��@@@@�� @��� @��@��	 @���
 @��@���Р/handle_uncaught�� [��� [��@���$exit����$bool�� [��� [��@@��! [���" [��@@��@��@����$unit��- [���. [��@@��0 [���1 [��@@����$unit��8 [���9 [��@@��; [���< [��@@��> [���? [��@@����$unit��F [���G [��@@��I [���J [��@@��L [���M [��@@��O [���P [��@@@���)ocaml.doca�������
  S [handle_uncaught ~exit f] catches an exception escaping [f] and prints an error
    message to stderr.  Exits with return code 1 if [exit] is [true].  Otherwise returns
    unit.

    Note that since OCaml 4.02.0, it is not needed to use this at the entry point of your
    program as the OCaml runtime will do better than this function.
@��^ Tdd�_ Z��@@@��a Tdd�b Z��@@@��d [���e [��@��g [���h [��@���Р8handle_uncaught_and_exit��p _}��q _}�@��@��@����$unit��| _}��} _}�@@�� _}��� _}�@@��!a��� _}��� _}�@@��� _}��� _}�@@��!a��� _}��� _}�@@��� _}��� _}�@@@���)ocaml.doc��������	 [handle_uncaught_and_exit f] returns [f ()], unless that raises, in which case it
    prints the exception and exits nonzero. @��� ]���� ^N|@@@��� ]���� ^N|@@@��� _}}�� _}�@��� _}}�� _}�@���Р0reraise_uncaught��� l7;�� l7K@��@����&string��� l7N�� l7T@@��� l7N�� l7T@@��@��@����$unit��� l7Y�� l7]@@��� l7Y�� l7]@@��!a��� l7a�� l7c@@��� l7Y�� l7c@@��!a��� l7h�� l7j@@��� l7X�� l7j@@��� l7N�� l7j@@@���)ocaml.doc��������
  � Traces exceptions passing through.  Useful because in practice backtraces still don't
    seem to work.

    Example:
    {[
    let rogue_function () = if Random.bool () then failwith "foo" else 3
    let traced_function () = Exn.reraise_uncaught "rogue_function" rogue_function
    traced_function ();;
    ]}
    {v : Program died with Reraised("rogue_function", Failure "foo") v}
@��� a���� k46@@@��� a���� k46@@@��� l77�� l7j@��� l77�� l7j@���Р*does_raise�� t��� t��@��@��@����$unit�� t��� t��@@�� t��� t��@@�@�� t��� t��@@�� t��� t��@@����$bool��" t� �# t�@@��% t� �& t�@@��( t���) t�@@@���)ocaml.doc:�������	[ [does_raise f] returns [true] iff [f ()] raises, which is often useful in unit
    tests. @��7 r�8 s��@@@��: r�; s��@@@��= t���> t�@��@ t���A t�@���Р)backtrace��I w37�J w3@@��@����$unit��S w3C�T w3G@@��V w3C�W w3G@@����&string��^ w3K�_ w3Q@@��a w3K�b w3Q@@��d w3C�e w3Q@@@���)ocaml.docv�������	' The same as {!Printexc.get_backtrace} @��s v�t v2@@@��v v�w v2@@@��y w33�z w3Q@��| w33�} w3Q@���Р1initialize_module��� |�� | @��@����$unit��� |#�� |'@@��� |#�� |'@@����$unit��� |+�� |/@@��� |+�� |/@@��� |#�� |/@@@���)ocaml.doc��������	� User code never calls this.  It is called in [std_kernel.ml], as a top-level side
    effect, to change the display of exceptions and install an uncaught-exception
    printer. @��� ySS�� {�
@@@��� ySS�� {�
@@@��� |�� |/@��� |�� |/@@