Caml1999M019����            9binary_searchable_intf.ml����  /-  �   Q  o�����*ocaml.text��&_none_A@ �A�������	v Module types for a [binary_search] function for a sequence, and functors for building
    [binary_search] functions. @��9binary_searchable_intf.mlA@@�B Z {@@@��A@@�B Z {@@��A@@�B Z {@������&Import��D } ��D } �@@��D } }�D } �@@��D } }�D } �@�����7Indexable_without_tests�� IWc�!IWz@������A�    �#elt��-J���.J��@@@@A@@��0J���1J��@@��3J���4J��@���A�    �!t��=K���>K��@@@@A@@��@K���AK��@@��CK���DK��@���Р#get��LM���MM��@��@����!t��VM���WM��@@��YM���ZM��@@��@����#int��cM���dM��@@��fM���gM��@@����#elt��nM���oM��@@��qM���rM��@@��tM���uM��@@��wM���xM��@@@@��zM���{M��@��}M���~M��@���Р&length���N����N��@��@����!t���N����N��@@���N����N��@@����#int���N����N��@@���N����N��@@���N����N��@@@@���N����N��@���N����N��@@���IW}��O��@@���)ocaml.doc��������	� An [Indexable] type is a finite sequence of elements indexed by consecutive integers
    [0] ... [length t - 1].  [get] and [length] must be O(1) for the resulting
    [binary_search] to be lg(n). @���F � ���H3V@@@���F � ���H3V@@@���IWW��O��@���IWW��O��@�����)Indexable���Q����Q��@�����������7Indexable_without_tests���R����R�@���R����R�@@���R����R�@@���R����R�@�����(For_test���W����W��@�����Р'compare���X��X@��@����#elt��X�X@@��X�X@@��@����#elt��X�X!@@��X�X!@@����#int��X%�X(@@��X%�X(@@��X� X(@@��"X�#X(@@@@��%X�&X(@��(X�)X(@���Р%small��1Y)1�2Y)6@����#elt��9Y)<�:Y)?@@��<Y)<�=Y)?@@@@��?Y)-�@Y)?@��BY)-�CY)?@���Р#big��KZ@H�LZ@K@����#elt��SZ@S�TZ@V@@��VZ@S�WZ@V@@@@��YZ@D�ZZ@V@��\Z@D�]Z@V@���Р(of_array��e[W_�f[Wg@��@����%array��o[Wn�p[Ws@�����#elt��x[Wj�y[Wm@@��{[Wj�|[Wm@@@��~[Wj�[Ws@@����!t���[Ww��[Wx@@���[Ww��[Wx@@���[Wj��[Wx@@@@���[W[��[Wx@���[W[��[Wx@@���W� ��\y~@@���)ocaml.doc��������	� To implement the tests provided by [Binary_searchable], we need two
      different [elt] values [small < big], to be able to compare those values,
      and to be able to construct a [t] containing those values. @���T��V��@@@���T��V��@@@���W����\y~@���W����\y~@@���Q����]�@@@���Q����]�@���Q����]�@�����8Indexable1_without_tests���_����_��@������A�    �!t���`����`��@����!a���`����`��@@B@@@A@@���`����`��@@���`����`��@���Р#get���b����b��@��@����!t���b����b��@���!a���b����b��@@@���b����b��@@��@����#int��b���b��@@��b���b��@@��!a��
b���b��@@��b���b��@@��b���b��@@@@��b���b��@��b���b��@���Р&length��c��� c��@��@����!t��)c���*c��@��@��.c���/c��@@@��1c���2c��@@����#int��9c���:c��@@��<c���=c��@@��?c���@c��@@@@��Bc���Cc��@��Ec���Fc��@@��H_���Id��@@@��K_���Ld��@��N_���Od��@�����*Indexable1��Wf��Xf�@�����������8Indexable1_without_tests��fg#�gg;@��ig#�jg;@@��lg�mg;@@��og�pg;@�����(For_test��xi=F�yi=N@�����Р(of_array���jU]��jUe@��@����%array���jUm��jUr@�����$bool���jUh��jUl@@���jUh��jUl@@@���jUh��jUr@@����!t���jU{��jU|@�����$bool���jUv��jUz@@���jUv��jUz@@@���jUv��jU|@@���jUh��jU|@@@@���jUY��jU|@���jUY��jU|@@���i=Q��k}�@@@���i=?��k}�@���i=?��k}�@@���f���l��@@@���f����l��@���f����l��@���A�    �-binary_search���n����n��@����!t���n����n��@@B����#elt���n����n��@@B@@@A����#pos����#int���o����o��@@���o����o��@@���#len����#int��p���p��@@��p���p��@@��@��!t��q���q��@@���'compare��@��#elt��r���r��@@��@��#elt��#r���$r��@@����#int��+r���,r��@@��.r���/r��@@��1r���2r��@@��4r���5r��@@��@����7Last_strictly_less_than���)ocaml.docM�������	) {v | < elt X |                       v} @��Js��Ks�E@@@��Ms��Ns�E@@@A@��:Last_less_than_or_equal_to���)ocaml.docb�������	) {v |      <= elt       X |           v} @��_tFn�`tF�@@@��btFn�ctF�@@@A@��-Last_equal_to���)ocaml.docw�������	) {v           |   = elt X |           v} @��tu���uu��@@@��wu���xu��@@@A@��.First_equal_to���)ocaml.doc��������	) {v           | X = elt   |           v} @���v���v�J@@@���v���v�J@@@A@��>First_greater_than_or_equal_to���)ocaml.doc��������	) {v           | X       >= elt      | v} @���wKs��wK�@@@���wKs��wK�@@@A@��;First_strictly_greater_than���)ocaml.doc��������	) {v                       | X > elt | v} @���x����x��@@@���x����x��@@@A@@@@���s����y��@@��@��#elt���z ��z 	@@����&option���{
��{
@�����#int���{
��{
@@���{
��{
@@@���{
��{
@@���z ��{
@@���s����{
@@���r����{
@@���q����{
@@���p����{
@@���o����{
@@@���n����{
@@���n����{
@���A�    �7binary_search_segmented���}+��}B@����!t��}!�}#@@B����#elt��
}%�})@@B@@@A����#pos����#int��~EO�~ER@@��~EO�~ER@@���#len����#int��&S]�'S`@@��)S]�*S`@@��@��!t��1 @af�2 @ah@@���*segment_of��@��#elt��= Aiz�> Ai~@@����$Left@A@��%Right@A@@@@��H Ai��I Ai�@@��K Aiz�L Ai�@@��@����,Last_on_left@A@��.First_on_right@A@@@@��X B���Y B��@@����&option��` C���a C��@�����#int��i C���j C��@@��l C���m C��@@@��o C���p C��@@��r B���s C��@@��u Ain�v C��@@��x @af�y C��@@��{SX�| C��@@��~~EJ� C��@@@���}�� C��@@���}�� C��@�����!S��� E���� E��@������A�    �#elt��� F���� F��@@@@A@@��� F���� F��@@��� F���� F��@���A�    �!t��� G���� G��@@@@A@@��� G���� G��@@��� G���� G��@���Р-binary_search��� J8>�� J8K@����-binary_search��� J8W�� J8d@�����!t��� J8O�� J8P@@��� J8O�� J8P@@�����#elt��� J8R�� J8U@@��� J8R�� J8U@@@��� J8N�� J8d@@@���)ocaml.doc�����	7 See [Binary_search.binary_search] in binary_search.ml @��� I���� I�7@@@��� I���� I�7@@@��� J8:�� J8d@��� J8:�� J8d@���Р7binary_search_segmented��� M���� M��@����7binary_search_segmented�� M��� M��@�����!t�� M��� M��@@�� M��� M��@@�����#elt�� M��� M��@@�� M��� M��@@@��  M���! M��@@@���)ocaml.doc2�������	A See [Binary_search.binary_search_segmented] in binary_search.ml @��/ Lfh�0 Lf�@@@��2 Lfh�3 Lf�@@@��5 M���6 M��@��8 M���9 M��@@��; E���< N��@@@��> E���? N��@��A E���B N��@�����"S1��J P�	�K P�	@������A�    �!t��W Q	
	�X Q	
	@����!a��_ Q	
	�` Q	
	@@B@@@A@@��b Q	
	�c Q	
	@@��e Q	
	�f Q	
	@���Р-binary_search��n S		�o S		*@����-binary_search��v S		B�w S		O@�����!t�� S		;�� S		<@���!a��� S		8�� S		:@@@��� S		8�� S		<@@���!a��� S		>�� S		@@@@��� S		7�� S		O@@@@��� S		�� S		O@��� S		�� S		O@���Р7binary_search_segmented��� T	P	V�� T	P	m@����7binary_search_segmented��� T	P	{�� T	P	�@�����!t��� T	P	t�� T	P	u@���!a��� T	P	q�� T	P	s@@@��� T	P	q�� T	P	u@@���!a��� T	P	w�� T	P	y@@@��� T	P	p�� T	P	�@@@@��� T	P	R�� T	P	�@��� T	P	R�� T	P	�@@��� P�	�� U	�	�@@@��� P���� U	�	�@��� P���� U	�	�@�����1Binary_searchable��� W	�	��� W	�	�@��������!S��� X	�	��� X	�	�@�����!S��� X	�	��� X	�	�@��� X	�	��� X	�	�@@@��� X	�	��� X	�	�@��� X	�	��� X	�	�@�����"S1�� Y	�	�� Y	�	�@�����"S1�� Y	�	�� Y	�	�@�� Y	�	�� Y	�	�@@@�� Y	�	�� Y	�	�@�� Y	�	�� Y	�	�@�����)Indexable��! Z	�
�" Z	�
@�����)Indexable��* Z	�
�+ Z	�
@��- Z	�
�. Z	�
@@@��0 Z	�	��1 Z	�
@��3 Z	�	��4 Z	�
@�����*Indexable1��< [

*�= [

4@�����*Indexable1��E [

7�F [

A@��H [

7�I [

A@@@��K [

�L [

A@��N [

�O [

A@�����$Make��W ]
C
L�X ]
C
P@���!T��^ ]
C
S�_ ]
C
T@�����)Indexable��g ]
C
W�h ]
C
`@��j ]
C
W�k ]
C
`@@��������!S��v ]
C
e�w ]
C
f@��y ]
C
e�z ]
C
f@@��    �!t��� ]
C
u�� ]
C
v@@@@A������!T!t��� ]
C
}�� ]
C
�@@��� ]
C
}�� ]
C
�@@@��� ]
C
m�� ]
C
�@@��� ]
C
e�� ]
C
�@@��    �#elt��� ]
C
��� ]
C
�@@@@A������!T#elt��� ]
C
��� ]
C
�@@��� ]
C
��� ]
C
�@@@��� ]
C
��� ]
C
�@@��� ]
C
e�� ]
C
�@@��� ]
C
R�� ]
C
�@@@��� ]
C
E�� ]
C
�@��� ]
C
E�� ]
C
�@�����%Make1��� ^
�
��� ^
�
�@���!T��� ^
�
��� ^
�
�@�����*Indexable1��� ^
�
��� ^
�
�@��� ^
�
��� ^
�
�@@������"S1��� ^
�
��� ^
�
�@��� ^
�
��� ^
�
�@@��    �!t��� ^
�
��� ^
�
�@����!a��� ^
�
��� ^
�
�@@B@@@A������!T!t��� ^
�
��� ^
�
�@���!a�� ^
�
�� ^
�
�@@@�� ^
�
��	 ^
�
�@@@�� ^
�
�� ^
�
�@@�� ^
�
�� ^
�
�@@�� ^
�
�� ^
�
�@@@�� ^
�
�� ^
�
�@�� ^
�
�� ^
�
�@�����2Make_without_tests��  _
�
��! _
�
�@���!T��' _
�
��( _
�
�@�����7Indexable_without_tests��0 _
�
��1 _
�@��3 _
�
��4 _
�@@��������!S��? _
��@ _
�@��B _
��C _
�@@��    �!t��J `"�K `#@@@@A������!T!t��U `)�V `,@@��X `)�Y `,@@@��[ `�\ `,@@��^ _
��_ `,@@��    �#elt��f a-;�g a->@@@@A������!T#elt��q a-B�r a-G@@��t a-B�u a-G@@@��w a-6�x a-G@@��z _
��{ a-G@@��} _
�
��~ a-G@@@��� _
�
��� a-G@��� _
�
��� a-G@�����3Make1_without_tests��� bHQ�� bHd@���!T��� bHf�� bHg@�����8Indexable1_without_tests��� bHj�� bH�@��� bHj�� bH�@@������"S1��� bH��� bH�@��� bH��� bH�@@��    �!t��� c���� c��@����!a��� c���� c��@@B@@@A������!T!t��� c���� c��@���!a��� c���� c��@@@��� c���� c��@@@��� c���� c��@@��� bH��� c��@@��� bHe�� c��@@@��� bHJ�� c��@��� bHJ�� c��@@��� W	�	��� d��@@@��� W	�	��� d��@��� W	�	��� d��@@