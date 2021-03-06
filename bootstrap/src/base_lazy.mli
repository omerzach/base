Caml1999N018����            -base_lazy.mli����  �  G  �  �����*ocaml.text��&_none_A@ �A�������	J This file is a modified version of lazy.mli from the OCaml distribution. @��-base_lazy.mliA@@�A@ O@@@��A@@�A@ O@@��A@@�A@ O@�����*ocaml.text�������
  E A value of type ['a Lazy.t] is a deferred computation, called
   a suspension, that has a result of type ['a].  The special
   expression syntax [lazy (expr)] makes a suspension of the
   computation of [expr], without computing [expr] itself yet.
   "Forcing" the suspension will then compute [expr] and return its
   result.

   Note: [lazy_t] is the built-in type constructor used by the compiler
   for the [lazy] keyword.  You should not use it directly.  Always use
   [Lazy.t] instead.

   Note: [Lazy.force] is not thread-safe.  If you use this module in
   a multi-threaded program, you will need to add some locks.

   Note: if the program is compiled with the [-rectypes] option,
   ill-founded recursive definitions of the form [let rec x = lazy x]
   or [let rec x = lazy(lazy(...(lazy x)))] are accepted by the type-checker
   and lead, when forced, to ill-formed values that trigger infinite
   loops in the garbage collector and other parts of the run-time system.
   Without the [-rectypes] option, such ill-founded recursive definitions
   are rejected by the type-checker.
@��C Q Q�X��@@@��C Q Q�X��@@��C Q Q�X��@������&Import��(Z���)Z��@@��+Z���,Z��@@��.Z���/Z��@���A�    �!t��8\���9\��@����!a��@\���A\��@@B@@@A�����&lazy_t��I\���J\��@���!a��P\���Q\��@@@��S\���T\��@@@��V\���W\��@@��Y\���Z\��@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexp>��@��@������'Sexplib$Sexp!tC@C@��FE@E@��@������U@U@����ZY���UT@@\@\@T@@@>>���Р)sexp_of_tb��@��@��a`@������'Sexplib$Sexp!ti@i@i@��@����xw���sr@@z@�������@�@�@x@@@bb���Р+hash_fold_t���@��@�����$Hash%state�@�@��@����@�����
�@�@�@�@��@������@�@��@�����������@@�@����� �@�@�@�@�@@@�����Р'compare���@��@����@��@����@����#int�@�@�@�@��@�����ʠ����@@�@��@�����Ӡ����@@�@�����@�@�@�@�@@@��@�@�@������������%Monad!S��^��� ^��@��"^���#^��@@��    �!t��*^� �+^�@����!a��2^���3^��@@B@@@A�����!t��;^��<^�	@���!a��B^��C^�@@@��E^��F^�	@@@��H^���I^�	@@��K^���L^�	@@��N^���O^�	@@��Q^���R^�	@�����)Undefined��Z`�[`@��@@��_`�``@@��b`�c`@���Р%force��kien�lies@��@����!t��uiey�viez@���!a��|iev�}iex@@@��iev��iez@@��!a���ie~��ie�@@���iev��ie�@@�+%lazy_force@���)ocaml.doc��������
  ? [force x] forces the suspension [x] and returns its result.
   If [x] has already been forced, [Lazy.force x] returns the
   same value again without recomputing it.  If it raised an exception,
   the same exception is raised again.
   Raise [Undefined] if the forcing of [x] tries to force [x] itself
   recursively.
@���b  ��hbd@@@���b  ��hbd@@@���iee��ie�@���iee��ie�@���Р)force_val���o����o��@��@����!t���o����o��@���!a���o����o��@@@���o����o��@@��!a���o����o��@@���o����o��@@@���)ocaml.docڐ������	� Like [force] except that [force_val x] does not use an exception handler, so it may be
    more efficient.  However, if the computation of [x] raises an exception, it is
    unspecified whether [force_val x] raises the same exception or [Undefined].
@���k����n��@@@���k����n��@@@���o����o��@���o����o��@���Р(from_fun���u����u��@��@��@����$unit���u����u��@@���u����u��@@��!a���u����u��@@��u���u��@@����!t��	u���
u��@���!a��u���u��@@@��u���u��@@��u���u��@@@���)ocaml.doc(�������
   [from_fun f] is the same as [lazy (f ())] but slightly more efficient if [f] is a
    variable.  [from_fun] should only be used if the function [f] is already defined.  In
    particular it is always less efficient to write [from_fun (fun () -> expr)] than [lazy
    expr]. @��%q���&t��@@@��(q���)t��@@@��+u���,u��@��.u���/u��@���Р(from_val��7z	�	��8z	�	�@��@��!a��?z	�	��@z	�	�@@����!t��Gz	�	��Hz	�	�@���!a��Nz	�	��Oz	�	�@@@��Qz	�	��Rz	�	�@@��Tz	�	��Uz	�	�@@@���)ocaml.docf�������	� [from_val v] returns an already-forced suspension of [v] (where [v] can be any
    expression).  Essentially, [from_val expr] is the same as [let var = expr in lazy
    var]. @��cw���dy	�	�@@@��fw���gy	�	�@@@��iz	�	��jz	�	�@��lz	�	��mz	�	�@���Р&is_val��u~
"
&�v~
"
,@��@����!t��~
"
2��~
"
3@���!a���~
"
/��~
"
1@@@���~
"
/��~
"
3@@����$bool���~
"
7��~
"
;@@���~
"
7��~
"
;@@���~
"
/��~
"
;@@@���)ocaml.doc��������	^ [is_val x] returns [true] if [x] has already been forced and
    did not raise an exception. @���|	�	���}	�
!@@@���|	�	���}	�
!@@@���~
"
"��~
"
;@���~
"
"��~
"
;@�����+T_unforcing��� E���� E��@�����@�    �!t��� F���� F��@����!a��� F���� F��@@B@@@A�����!t��� F���� F��@���!a��� F���� F��@@@��� F���� F��@@@��� F���� F�@@��� F���� F�@��������������������@@@@���Р)sexp_of_t<��@��@��;:@������fed@@@@@@��@����ON���JI@@Q@������utsW@W@W@O@@@99@6@6@6@�� E��� G@@���)ocaml.doc-�������
  x This type offers a serialization function [sexp_of_t] that won't force its argument.
    Instead, it will serialize the ['a] if it is available, or just use a custom string
    indicating is not forced.  Note that this is not a round-trippable type, thus the type
    does not expose [of_sexp].  To be used in debug code for example, or while tracking an
    Heisenbug, etc. @��* @
=
=�+ D��@@@��- @
=
=�. D��@@@��0 E���1 G@��3 E���4 G@@