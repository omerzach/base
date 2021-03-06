Caml1999N018����            .heap_block.mli����  �  w  �  $�����*ocaml.text��&_none_A@ �A�������
  � A heap block is a value that is guaranteed to live on the OCaml heap, and is hence
    guaranteed to be usable with finalization or in a weak pointer.  It is an abstract
    type so we can use the type system to guarantee that the values we put in weak
    pointers and use with finalizers are heap blocks.

    Some examples of values that are not heap-allocated are integers, constant
    constructors, booleans, the empty array, the empty list, the unit value.  The exact
    list of what is heap-allocated or not is implementation-dependent.  Some constant
    values can be heap-allocated but never deallocated during the lifetime of the program,
    for example a list of integer constants; this is also implementation-dependent.  You
    should also be aware that compiler optimizations may duplicate some immutable values,
    for example floating-point numbers when stored into arrays; thus they can be finalized
    and collected while another copy is still in use by the program.

    The results of calling {!String.make}, {!String.create}, {!Array.make}, and
    {!Pervasives.ref} are guaranteed to be heap-allocated and non-constant except when the
    length argument is [0].
@��.heap_block.mliA@@�R��@@@��A@@�R��@@��A@@�R��@������&Import��T���T��@@��T���T��@@��T���T��@���A�    �!t��!V���"V��@����!a��)V���*V��@@@@@@@���!a��0V���1V��@@@��3V���4V��@@��6V���7V��@�����������-ocaml.warning�������#-32@@@@���Р)sexp_of_t2��@��@��10@������'Sexplib$Sexp!t9@9@9@��@����HG���CB@@J@������P@P@P@H@@@>>@;@;@;���Р&create��wZOS�xZOY@��@��!a��ZO`��ZOb@@����&option���ZOk��ZOq@�����!t���ZOi��ZOj@���!a���ZOf��ZOh@@@���ZOf��ZOj@@@���ZOf��ZOq@@���ZO`��ZOq@@@���)ocaml.doc��������	^ [create v] returns [Some t] if [v] is a heap block, where [t] is physically equal
    to [v] @���X����YAN@@@���X����YAN@@@���ZOO��ZOq@���ZOO��ZOq@���Р*create_exn���[rv��[r�@��@��!a���[r���[r�@@����!t���[r���[r�@���!a���[r���[r�@@@���[r���[r�@@���[r���[r�@@@@���[rr��[r�@���[rr��[r�@���Р%value���^����^��@��@����!t���^����^��@���!a���^����^��@@@��^���^��@@��!a��^���^��@@��
^���^��@@@���)ocaml.doc�������	= [value t] returns the value that is physically equal to [t] @��]���]��@@@��]���]��@@@��^��� ^��@��"^���#^��@���Р%bytes��+c���,c��@��@����!t��5c���6c��@��@��:c���;c��@@@��=c���>c��@@����#int��Ec���Fc��@@��Hc���Ic��@@��Kc���Lc��@@@���)ocaml.doc]�������	� [bytes t] returns the number of bytes on the heap taken by heap block [t], including
    the header.  This is just the space for the single block, not anything it points
    to. @��Z`���[b��@@@��]`���^b��@@@��`c���ac��@��cc���dc��@@