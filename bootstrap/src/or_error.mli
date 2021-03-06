Caml1999N018����            ,or_error.mli����  7�  �  #�  !ࠠ���*ocaml.text��&_none_A@ �A�������
  % Type for tracking errors in an Error.t. This is a specialization of the Result type,
    where the Error constructor carries an Error.t.

    A common idiom is to wrap a function that is not implemented on all platforms, e.g.:

    val do_something_linux_specific : (unit -> unit) Or_error.t
@��,or_error.mliA@@�G(*@@@��A@@�G(*@@��A@@�G(*@������&Import��I,2�I,8@@��I,,�I,8@@��I,,�I,8@���A�    �!t��!L���"L��@����!a��)L���*L��@@B@@@A������&Result!t��4L���5L��@���!a��;L���<L��@@������%Error!t��FL���GL��@@��IL���JL��@@@��LL���ML��@@���)ocaml.doc^�������	M Serialization and comparison of an [Error] force the error's lazy message. *@��[K::�\K:�@@@��^K::�_K:�@@@��aL���bL��@@��dL���eL��@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexp`��@��@������'Sexplib$Sexp!te@e@��hg@g@��@������w@w@����|{���wv@@~@~@v@@@>>���Р)sexp_of_t���@��@����@������'Sexplib$Sexp!t�@�@�@��@�����������@@�@�������@�@�@�@@@bb���Р+hash_fold_t���@��@�����$Hash%state�@�@��@����@�����
�@�@�@�@��@������@�@��@�����ɠ����@@�@����� �@�@�@�@�@@@�����Р'compareװ�@��@����@��@����@����#int�@�@�@�@��@�����젰���@@�@��@�����������@@�@�����@�@�@�@�@@@��@�@�@������������+Applicative!S��*R���+R��@��-R���.R��@@��    �!t��5R��6R�@����!a��=R��>R�@@B@@@A�����!t��FR��GR�@���!a��MR��NR�@@@��PR��QR�@@@��SR���TR�@@��VR���WR�@@��YR���ZR�@���)ocaml.dock�������
   [Applicative] functions don't have quite the same semantics as
    [Applicative.of_Monad(Or_error)] would give -- [apply (Error e1) (Error e2)] returns
    the combination of [e1] and [e2], whereas it would only return [e1] if it were defined
    using [bind]. @��hN���iQ��@@@��kN���lQ��@@@��nR���oR�@�����������)Container"S1��~S�S$@���S��S$@@��    �!t���S8��S9@����!a���S5��S7@@B@@@A�����!t���S@��SA@���!a���S=��S?@@@���S=��SA@@@���S0��SA@@���S��SA@@���S��SA@@���S��SA@�����������)Invariant"S1���TBJ��TBV@���TBJ��TBV@@��    �!t���TBj��TBk@����!a���TBg��TBi@@B@@@A�����!t���TBr��TBs@���!a���TBo��TBq@@@���TBo��TBs@@@���TBb��TBs@@���TBJ��TBs@@���TBB��TBs@@���TBB��TBs@�����������%Monad!S��Ut|�Ut�@��Ut|�Ut�@@��    �!t��Ut��Ut�@����!a��Ut��Ut�@@B@@@A�����!t��Ut��Ut�@���!a��%Ut��&Ut�@@@��(Ut��)Ut�@@@��+Ut��,Ut�@@��.Ut|�/Ut�@@��1Utt�2Ut�@@��4Utt�5Ut�@���Р&ignore��=W���>W��@��@����!t��GW���HW��@��@��LW���MW��@@@��OW���PW��@@����!t��WW���XW��@�����$unit��`W���aW��@@��cW���dW��@@@��fW���gW��@@��iW���jW��@@@@��lW���mW��@��oW���pW��@���Р(try_with��x]���y]��@���)backtrace����$bool���]���]�@@���]���]�@���)ocaml.doc��������5 defaults to [false] @���]���]�0@@@���]���]�0@@@��@��@����$unit���]�5��]�9@@���]�5��]�9@@��!a���]�=��]�?@@���]�5��]�?@@����!t���]�I��]�J@���!a���]�F��]�H@@@���]�F��]�J@@���]�4��]�J@@���]���]�J@@@���)ocaml.docې������
  ) [try_with f] catches exceptions thrown by [f] and returns them in the Result.t as an
    Error.t.  [try_with_join] is like [try_with], except that [f] can throw exceptions or
    return an Error directly, without ending up with a nested error; it is equivalent to
    [Result.join (try_with f)]. @���Y����\��@@@���Y����\��@@@���]����]�J@���]����]�J@���Р-try_with_join���^KO��^K\@���)backtrace����$bool���^Kj��^Kn@@���^Kj��^Kn@���)ocaml.doc�������5 defaults to [false] @��^Ko�	^K�@@@��^Ko�^K�@@@��@��@����$unit��^K��^K�@@��^K��^K�@@����!t��"^K��#^K�@���!a��)^K��*^K�@@@��,^K��-^K�@@��/^K��0^K�@@����!t��7^K��8^K�@���!a��>^K��?^K�@@@��A^K��B^K�@@��D^K��E^K�@@��G^K_�H^K�@@@@��J^KK�K^K�@��M^KK�N^K�@���Р&ok_exn��Vb!%�Wb!+@��@����!t��`b!1�ab!2@���!a��gb!.�hb!0@@@��jb!.�kb!2@@��!a��pb!6�qb!8@@��sb!.�tb!8@@@���)ocaml.doc��������	v [ok_exn t] throws an exception if [t] is an [Error], and otherwise returns the
    contents of the [Ok] constructor. @���`����a� @@@���`����a� @@@���b!!��b!8@���b!!��b!8@���Р&of_exn���emq��emw@���)backtrace����#Get@A@��$This@@�����&string���em���em�@@���em���em�@@@@@@���em���em�@@��@����#exn���em���em�@@���em���em�@@����!t���em���em�@��@���em���em�@@@���em���em�@@���em���em�@@���emz��em�@@@���)ocaml.doc䐠�����	- [of_exn exn] is [Error (Error.of_exn exn)]. @���d::��d:l@@@���d::��d:l@@@���emm��em�@���emm��em�@���Р-of_exn_result���h���h�@��@�����&Result!t���h�� h�$@���!a��h��h�@@�����#exn��h��h�@@��h��h�@@@��h��h�$@@����!t��h�+�h�,@���!a��$h�(�%h�*@@@��'h�(�(h�,@@��*h��+h�,@@@���)ocaml.doc<�������	I [of_exn_result (Ok a) = Ok a], [of_exn_result (Error exn) = of_exn exn] @��9g���:g��@@@��<g���=g��@@@��?h���@h�,@��Bh���Ch�,@���Р%error��Ku		�Lu		@���&strict����$unit��Wv		(�Xv		,@@��Zv		(�[v		,@@��@����&string��dw	-	2�ew	-	8@@��gw	-	2�hw	-	8@@��@��!a��ox	9	>�px	9	@@@��@��@��!a��yy	A	G�zy	A	I@@�����$Sexp!t���y	A	M��y	A	S@@���y	A	M��y	A	S@@���y	A	G��y	A	S@@����!t���z	U	\��z	U	]@��@���z	U	Z��z	U	[@@@���z	U	Z��z	U	]@@���y	A	F��z	U	]@@���x	9	>��z	U	]@@���w	-	2��z	U	]@@���v		��z	U	]@@@���)ocaml.doc��������
  � [error] is a wrapper around [Error.create]:

    {[
      error ?strict message a sexp_of_a
      = Error (Error.create ?strict message a sexp_of_a)
    ]}

    As with [Error.create], [sexp_of_a a] is lazily computed, when the info is converted
    to a sexp.  So, if [a] is mutated in the time between the call to [create] and the
    sexp conversion, those mutations will be reflected in the sexp.  Use [~strict:()] to
    force [sexp_of_a a] to be computed immediately. @���j..��t�	@@@���j..��t�	@@@���u		��z	U	]@���u		��z	U	]@���Р'error_s���|	_	c��|	_	j@��@�����$Sexp!t���|	_	m��|	_	s@@���|	_	m��|	_	s@@����!t���|	_	y��|	_	z@��@���|	_	w��|	_	x@@@���|	_	w��|	_	z@@���|	_	m��|	_	z@@@@���|	_	_��|	_	z@���|	_	_��|	_	z@���Р,error_string���	�	���	�	�@��@����&string��	�	��	�	�@@��	�	��	�	�@@����!t��	�	��	�	�@��@��	�	��	�	�@@@��	�	��	�	�@@��	�	��	�	�@@@���)ocaml.doc)�������	= [error_string message] is [Error (Error.of_string message)] @��&~	|	|�'~	|	�@@@��)~	|	|�*~	|	�@@@��,	�	��-	�	�@��/	�	��0	�	�@���Р&errorf��8 D
�
��9 D
�
�@��@����'format4��B D
�
��C D
�
�@���!a��I D
�
��J D
�
�@@�����$unit��R D
�
��S D
�
�@@��U D
�
��V D
�
�@@�����&string��^ D
�
��_ D
�
�@@��a D
�
��b D
�
�@@�����!t��j D
�
��k D
�
�@��@��o D
�
��p D
�
�@@@��r D
�
��s D
�
�@@@��u D
�
��v D
�
�@@��!a��{ D
�
��| D
�
�@@��~ D
�
�� D
�
�@@@���)ocaml.doc��������	� [errorf format arg1 arg2 ...] is [Error (sprintf format arg1 arg2 ...)].  Note that it
    calculates the string eagerly, so when performance matters you may want to use [error]
    instead. @��� A	�	��� C
�
�@@@��� A	�	��� C
�
�@@@��� D
�
��� D
�
�@��� D
�
��� D
�
�@���Р#tag��� H6:�� H6=@��@����!t��� H6C�� H6D@���!a��� H6@�� H6B@@@��� H6@�� H6D@@���#tag����&string��� H6L�� H6R@@��� H6L�� H6R@@����!t��� H6Y�� H6Z@���!a��� H6V�� H6X@@@��� H6V�� H6Z@@��� H6H�� H6Z@@��� H6@�� H6Z@@@���)ocaml.doc쐠�����	U [tag t ~tag] is [Result.map_error t ~f:(Error.tag ~tag)].
    [tag_arg] is similar. @��� F
�
��� G5@@@��� F
�
��� G5@@@��� H66�� H6Z@��� H66�� H6Z@���Р'tag_arg��� I[_�� I[f@��@����!t�� I[l� I[m@���!a�� I[i� I[k@@@�� I[i� I[m@@��@����&string�� I[q� I[w@@�� I[q� I[w@@��@��!b��$ I[{�% I[}@@��@��@��!b��. I[��/ I[�@@�����$Sexp!t��8 I[��9 I[�@@��; I[��< I[�@@��> I[��? I[�@@����!t��F I[��G I[�@���!a��M I[��N I[�@@@��P I[��Q I[�@@��S I[��T I[�@@��V I[{�W I[�@@��Y I[q�Z I[�@@��\ I[i�] I[�@@@@��_ I[[�` I[�@��b I[[�c I[�@���Р-unimplemented��k O���l O��@��@����&string��u O���v O��@@��x O���y O��@@����!t��� O���� O��@��@��� O���� O��@@@��� O���� O��@@��� O���� O��@@@���)ocaml.doc��������
  * For marking a given value as unimplemented.  Typically combined with conditional
    compilation, where on some platforms the function is defined normally, and on some
    platforms it is defined as unimplemented.  The supplied string should be the name of
    the function that is unimplemented. @��� K���� N��@@@��� K���� N��@@@��� O���� O��@��� O���� O��@���Р.combine_errors��� W$(�� W$6@��@����$list��� W$>�� W$B@�����!t��� W$<�� W$=@���!a��� W$9�� W$;@@@��� W$9�� W$=@@@��� W$9�� W$B@@����!t��� W$N�� W$O@�����$list��� W$I�� W$M@���!a��� W$F�� W$H@@@��� W$F�� W$M@@@��� W$F�� W$O@@��� W$9�� W$O@@@���)ocaml.doc��������
  2 [combine_errors ts] returns [Ok] if every element in [ts] is [Ok], else it returns
    [Error] with all the errors in [ts].  More precisely:

    | combine_errors [Ok a1; ...; Ok an] = Ok [a1; ...; an]
    | combine_errors [...; Error e1; ...; Error en; ...]
    |   = Error (Error.of_list [e1; ...; en]) @��� Q���� V�#@@@��� Q���  V�#@@@�� W$$� W$O@�� W$$� W$O@���Р3combine_errors_unit�� [��� [�@��@����$list�� [�� [�@�����!t��! [��" [�@�����$unit��* [�
�+ [�@@��- [�
�. [�@@@��0 [�
�1 [�@@@��3 [�
�4 [�@@����!t��; [��< [�@�����$unit��D [��E [�@@��G [��H [�@@@��J [��K [�@@��M [�
�N [�@@@���)ocaml.doc_�������	� [combine_errors_unit] returns [Ok] if every element in [ts] is [Ok ()], else it
    returns [Error] with all the errors in [ts], like [combine_errors]. @��\ YQQ�] Z��@@@��_ YQQ�` Z��@@@��b [���c [�@��e [���f [�@���Р6filter_ok_at_least_one��n _���o _��@��@����$list��x _���y _��@�����!t��� _���� _��@���!a��� _���� _��@@@��� _���� _��@@@��� _���� _��@@����!t��� _���� _��@�����$list��� _���� _��@���!a��� _���� _��@@@��� _���� _��@@@��� _���� _��@@��� _���� _��@@@���)ocaml.doc��������	� [filter_ok_at_least_one ts] returns all values in [ts] that are [Ok] if there is at
    least one, otherwise it returns the same error as [combine_errors ts]. @��� ]!!�� ^y�@@@��� ]!!�� ^y�@@@��� _���� _��@��� _���� _��@���Р'find_ok��� c~��� c~�@��@����$list��� c~��� c~�@�����!t��� c~��� c~�@���!a��� c~��� c~�@@@��� c~��� c~�@@@��� c~��� c~�@@����!t��� c~��� c~�@���!a��� c~��  c~�@@@�� c~�� c~�@@�� c~�� c~�@@@���)ocaml.doc�������	| [find_ok ts] returns the first value in [ts] that is [Ok], otherwise it returns the
    same error as [combine_errors ts]. @�� a��� bT}@@@�� a��� bT}@@@�� c~~� c~�@�� c~~� c~�@���Р+find_map_ok��& gAE�' gAP@��@����$list��0 gAV�1 gAZ@���!a��7 gAS�8 gAU@@@��: gAS�; gAZ@@���!f��@��!a��F gAa�G gAc@@����!t��N gAj�O gAk@���!b��U gAg�V gAi@@@��X gAg�Y gAk@@��[ gAa�\ gAk@@����!t��c gAs�d gAt@���!b��j gAp�k gAr@@@��m gAp�n gAt@@��p gA^�q gAt@@��s gAS�t gAt@@@���)ocaml.doc��������	� [find_map_ok l ~f] returns the first value in [l] for which [f] returns [Ok],
    otherwise it returns the same error as [combine_errors (List.map l ~f)]. @��� e���� f�@@@@��� e���� f�@@@@��� gAA�� gAt@��� gAA�� gAt@@