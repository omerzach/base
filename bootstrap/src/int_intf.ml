Caml1999M019����            +int_intf.ml����  c�  �  @�  >�������&Import��+int_intf.mlA@F�A@L@@��A@@�A@L@@��A@@�A@L@�����%Round��CNZ�CN_@������A�    �!t��Dfm�Dfn@@@@A@@�� Dfh�!Dfn@@��#Dfh�$Dfn@�����*ocaml.text��&_none_A@ �A�������
  ` [round] rounds an int to a multiple of a given [to_multiple_of] argument, according
     to a direction [dir], with default [dir] being [`Nearest].  [round] will raise if
     [to_multiple_of <= 0].

     {v
       | `Down    | rounds toward Int.neg_infinity                          |
       | `Up      | rounds toward Int.infinity                              |
       | `Nearest | rounds to the nearest multiple, or `Up in case of a tie |
       | `Zero    | rounds toward zero                                      |
     v}

     Here are some examples for [round ~to_multiple_of:10] for each direction:

     {v
       | `Down    | {10 .. 19} --> 10 | { 0 ... 9} --> 0 | {-10 ... -1} --> -10 |
       | `Up      | { 1 .. 10} --> 10 | {-9 ... 0} --> 0 | {-19 .. -10} --> -10 |
       | `Zero    | {10 .. 19} --> 10 | {-9 ... 9} --> 0 | {-19 .. -10} --> -10 |
       | `Nearest | { 5 .. 14} --> 10 | {-5 ... 4} --> 0 | {-15 ... -6} --> -10 |
     v}

     For convenience and performance, there are variants of [round] with [dir] hard-coded.
     If you are writing performance-critical code you should use these.
  @��7Fpr�8\��@@@��:Fpr�;\��@@��=Fpr�>\��@���Р%round��F^���G^��@���#dir����$Zero@A@��'Nearest@A@��"Up@A@��$Down@A@@@@��[^���\^��@@��@����!t��e^���f^��@@��h^���i^��@@���.to_multiple_of����!t��t^���u^��@@��w^���x^��@@����!t��^����^��@@���^����^��@@���^����^��@@���^����^��@@���^����^��@@@@���^����^��@���^����^��@���Р2round_towards_zero���`����`�@��@����!t���`�	��`�
@@���`�	��`�
@@���.to_multiple_of����!t���`���`�@@���`���`�@@����!t���`�"��`�#@@���`�"��`�#@@���`���`�#@@���`�	��`�#@@@@���`����`�#@���`����`�#@���Р*round_down���a$*��a$4@��@����!t���a$?��a$@@@���a$?��a$@@@���.to_multiple_of����!t���a$S��a$T@@���a$S��a$T@@����!t���a$X��a$Y@@���a$X��a$Y@@�� a$D�a$Y@@��a$?�a$Y@@@@��a$&�a$Y@��	a$&�
a$Y@���Р(round_up��bZ`�bZh@��@����!t��bZu�bZv@@��bZu� bZv@@���.to_multiple_of����!t��+bZ��,bZ�@@��.bZ��/bZ�@@����!t��6bZ��7bZ�@@��9bZ��:bZ�@@��<bZz�=bZ�@@��?bZu�@bZ�@@@@��BbZ\�CbZ�@��EbZ\�FbZ�@���Р-round_nearest��Nc���Oc��@��@����!t��Xc���Yc��@@��[c���\c��@@���.to_multiple_of����!t��gc���hc��@@��jc���kc��@@����!t��rc���sc��@@��uc���vc��@@��xc���yc��@@��{c���|c��@@@@��~c���c��@���c����c��@@���CNb��d��@@@���CNN��d��@���CNN��d��@�����'Hexable���f����f��@������A�    �!t���g����g��@@@@A@@���g����g��@@���g����g��@�����#Hex���h����h��@�����@�    �!t���i��i@@@@A�����!t���i��i@@���i��i@@@���i��i7@@���i��i7@�����������-ocaml.warning�������#-32@@@@���Р+hash_fold_t/��@�����$Hash%state8@8@��@����?>@>@�����C@C@C@C@@@44���Р$hashI��@����PO@O@�����*hash_valueU@U@U@@@FF���Р'compare[��@����ba@a@��@����hg@g@����#intl@l@l@l@@@]]���Р)t_of_sexpr��@������'Sexplib$Sexp!t}@}@������@�@�@@@rr���Р)sexp_of_t���@������@�@������'Sexplib$Sexp!t�@�@�@@@��@�@�@������������*Stringable!S��^k9E�_k9Q@��ak9E�bk9Q@@��    �!t��ik9\�jk9]@@@@A�����!t��rk9a�sk9b@@��uk9a�vk9b@@@��xk9W�yk9b@@��{k9E�|k9b@@��~k9=�k9b@@���k9=��k9b@���Р-to_string_hum���mdl��mdy@���)delimiter����$char���md���md�@@���md���md�@@��@����!t���md���md�@@���md���md�@@����&string���md���md�@@���md���md�@@���md���md�@@���md|��md�@@@@���mdh��md�@���mdh��md�@@���h����n��@@@���h����n��@���h����n��@@���f����o��@@@���f����o��@���f����o��@�����!S���q����q��@������A�    �!t���r����r��@@@@A@@���r����r��@@���r����r��@������������������@@@@���Р)t_of_sexp!��@���������)@)@����.-@-@-@@@**���Р)sexp_of_t3��@����:9@9@���������?@?@?@@@<<���Р+hash_fold_tE��@�����@?L@L@��@����SR@R@�����KJW@W@W@W@@@TT���Р>\��@����cb@b@�����[=g@g@g@@@dd@a@a@a�����������)Floatable!S��Yt���Zt��@��\t���]t��@@��    �!t��dt��et�@@@@A�����!t��mt�
�nt�@@��pt�
�qt�@@@��st� �tt�@@��vt���wt�@@��yt���zt�@@��|t���}t�@�����������'Intable!S���u��u@���u��u@@��    �!t���u5��u6@@@@A�����!t���u:��u;@@���u:��u;@@@���u0��u;@@���u��u;@@���u��u;@@���u��u;@�����������,Identifiable!S���v<F��v<T@���v<F��v<T@@��    �!t���v<e��v<f@@@@A�����!t���v<j��v<k@@���v<j��v<k@@@���v<`��v<k@@���v<F��v<k@@���v<>��v<k@@���v<>��v<k@�����������*Comparable)With_zero���wlv��wl�@���wlv��wl�@@��    �!t���wl���wl�@@@@A�����!t��wl��wl�@@��	wl��
wl�@@@��wl��wl�@@��wlv�wl�@@��wln�wl�@@��wln�wl�@����������'Hexable��#x���$x��@��&x���'x��@@��    �!t��.x���/x��@@@@A�����!t��7x���8x��@@��:x���;x��@@@��=x���>x��@@��@x���Ax��@@��Cx���Dx��@@��Fx���Gx��@���Р-to_string_hum��O{��P{�@���)delimiter����$char��[{��\{� @@��^{��_{� @@��@����!t��h{�$�i{�%@@��k{�$�l{�%@@����&string��s{�)�t{�/@@��v{�)�w{�/@@��y{�$�z{�/@@��|{��}{�/@@@���)ocaml.docW�������	& [delimiter] is underscore by default @���z����z��@@@���z����z��@@@���{����{�/@���{����{�/@���Р(num_bits���������@����#int���������@@���������@@@���)ocaml.doc��������	l The number of bits available in this integer type.  Note that the integer
      representations are signed @���}13��~��@@@���}13��~��@@@���������@���������@�����*ocaml.text��������	$ {9 Infix operators and constants } @��� A���� A��@@@��� A���� A��@@��� A���� A��@���Р$zero��� C���� C��@����!t��� C���� C��@@��� C���� C��@@@@��� C���� C��@��� C���� C��@���Р#one��� D���� D�	 @����!t�� D�	� D�	@@�� D�	� D�	@@@@�� D���	 D�	@�� D��� D�	@���Р)minus_one�� E		� E		@����!t�� E		� E		@@�� E		�  E		@@@@��" E		�# E		@��% E		�& E		@���Р!+��. G		 �/ G		%@��@����!t��8 G		(�9 G		)@@��; G		(�< G		)@@��@����!t��E G		-�F G		.@@��H G		-�I G		.@@����!t��P G		2�Q G		3@@��S G		2�T G		3@@��V G		-�W G		3@@��Y G		(�Z G		3@@@@��\ G		�] G		3@��_ G		�` G		3@���Р!-��h H	4	:�i H	4	?@��@����!t��r H	4	B�s H	4	C@@��u H	4	B�v H	4	C@@��@����!t�� H	4	G�� H	4	H@@��� H	4	G�� H	4	H@@����!t��� H	4	L�� H	4	M@@��� H	4	L�� H	4	M@@��� H	4	G�� H	4	M@@��� H	4	B�� H	4	M@@@@��� H	4	6�� H	4	M@��� H	4	6�� H	4	M@���Р!*��� I	N	T�� I	N	Y@��@����!t��� I	N	\�� I	N	]@@��� I	N	\�� I	N	]@@��@����!t��� I	N	a�� I	N	b@@��� I	N	a�� I	N	b@@����!t��� I	N	f�� I	N	g@@��� I	N	f�� I	N	g@@��� I	N	a�� I	N	g@@��� I	N	\�� I	N	g@@@@��� I	N	P�� I	N	g@��� I	N	P�� I	N	g@���Р#neg��� L	{	��� L	{	�@��@����!t��� L	{	��� L	{	�@@��� L	{	��� L	{	�@@����!t��� L	{	��� L	{	�@@��� L	{	��� L	{	�@@��� L	{	��� L	{	�@@@���)ocaml.docҐ������* Negation @�� K	i	k� K	i	z@@@��	 K	i	k�
 K	i	z@@@�� L	{	}� L	{	�@�� L	{	}� L	{	�@���Р"~-�� M	�	�� M	�	�@��@����!t��" M	�	��# M	�	�@@��% M	�	��& M	�	�@@����!t��- M	�	��. M	�	�@@��0 M	�	��1 M	�	�@@��3 M	�	��4 M	�	�@@@@��6 M	�	��7 M	�	�@��9 M	�	��: M	�	�@���Р"/%��B b���C b��@��@����!t��L b���M b��@@��O b���P b��@@��@����!t��Y b���Z b��@@��\ b���] b��@@����!t��d b���e b��@@��g b���h b��@@��j b���k b��@@��m b���n b��@@@���)ocaml.docH�������
  � There are two pairs of integer division and remainder functions, [/%] and [%], and
      [/] and [rem].  They both satisfy the same equation relating the quotient and the
      remainder:

      {[
        x = (x /% y) * y + (x % y);
        x = (x /  y) * y + (rem x y);
      ]}

      The functions return the same values if [x] and [y] are positive.  They all raise
      if [y = 0].

      The functions differ if [x < 0] or [y < 0].

      If [y < 0], then [%] and [/%] raise, whereas [/] and [rem] do not.

      [x % y] always returns a value between 0 and [y - 1], even when [x < 0].  On the
      other hand, [rem x y] returns a negative value if and only if [x < 0]; that value
      satisfies [abs (rem x y) <= abs y - 1]. @��| O	�	��} a\�@@@�� O	�	��� a\�@@@��� b���� b��@��� b���� b��@���Р!%��� c���� c��@��@����!t��� c���� c��@@��� c���� c��@@��@����!t��� c���� c��@@��� c���� c��@@����!t��� c���� c��@@��� c���� c��@@��� c���� c��@@��� c���� c��@@@@��� c���� c��@��� c���� c��@���Р!/��� d���� d��@��@����!t��� d���� d��@@��� d���� d��@@��@����!t��� d���� d��@@��� d���� d��@@����!t��� d���� d��@@��� d���� d��@@��� d���� d��@@��� d���� d��@@@@��� d���� d��@��� d���� d��@���Р#rem�� e��� e��@��@����!t�� e��� e��@@�� e��� e��@@��@����!t�� e��� e��@@�� e��� e��@@����!t��$ e���% e��@@��' e���( e��@@��* e���+ e��@@��- e���. e��@@@@��0 e���1 e��@��3 e���4 e��@���Р"//��< h$�= h*@��@����!t��F h-�G h.@@��I h-�J h.@@��@����!t��S h2�T h3@@��V h2�W h3@@����%float��^ h7�_ h<@@��a h7�b h<@@��d h2�e h<@@��g h-�h h<@@@���)ocaml.docB�������< float division of integers @��v g���w g�@@@��y g���z g�@@@��| h �} h<@�� h �� h<@�����!O��� k���� k��@�����Рe��� m���� m��@��@����!t��� m���� m��@@��� m���� m��@@��@����!t��� m���� m��@@��� m���� m��@@����!t��� m���� m��@@��� m���� m��@@��� m���� m��@@��� m���� m��@@@@��� m���� m��@��� m���� m��@���Рd��� n���� n��@��@����!t��� n���� n��@@��� n���� n��@@��@����!t��� n���� n��@@��� n���� n��@@����!t��� n���� n��@@��� n���� n��@@��� n���� n��@@��� n���� n��@@@@��� n���� n��@��� n���� n��@���Рc�� o��� o��@��@����!t�� o��� o��@@�� o��� o��@@��@����!t�� o��� o��@@�� o��� o��@@����!t��& o���' o��@@��) o���* o��@@��, o���- o��@@��/ o���0 o��@@@@��2 o���3 o��@��5 o���6 o��@���Р!/��> p��? p�	@��@����!t��H p��I p�@@��K p��L p�@@��@����!t��U p��V p�@@��X p��Y p�@@����!t��` p��a p�@@��c p��d p�@@��f p��g p�@@��i p��j p�@@@@��l p� �m p�@��o p� �p p�@���Р"~-��x q �y q&@��@����!t��� q)�� q*@@��� q)�� q*@@����!t��� q.�� q/@@��� q.�� q/@@��� q)�� q/@@@@��� q�� q/@��� q�� q/@�����������8Polymorphic_compare_intf%Infix��� r0<�� r0Z@��� r0<�� r0Z@@��    �!t��� r0e�� r0f@@@@A�����!t��� r0j�� r0k@@��� r0j�� r0k@@@��� r0`�� r0k@@��� r0<�� r0k@@��� r04�� r0k@@��� r04�� r0k@���Р#abs��� tmu�� tmx@��@����!t��� tm~�� tm@@��� tm~�� tm@@����!t��� tm��� tm�@@��� tm��� tm�@@��� tm~�� tm�@@@@��� tmq�� tm�@��� tmq�� tm�@���Р#neg��� u���	  u��@��@����!t��		 u���	
 u��@@��	 u���	 u��@@����!t��	 u���	 u��@@��	 u���	 u��@@��	 u���	 u��@@@@��	 u���	 u��@��	  u���	! u��@���Р$zero��	) v���	* v��@����!t��	1 v���	2 v��@@��	4 v���	5 v��@@@@��	7 v���	8 v��@��	: v���	; v��@���Р*of_int_exn��	C w���	D w��@��@����#int��	M w���	N w��@@��	P w���	Q w��@@����!t��	X w���	Y w��@@��	[ w���	\ w��@@��	^ w���	_ w��@@@@��	a w���	b w��@��	d w���	e w��@���Р߰�	l y���	m y��@��@����!t��	v y���	w y��@@��	y y���	z y��@@��@����!t��	� y���	� y��@@��	� y���	� y��@@����!t��	� y���	� y��@@��	� y���	� y��@@��	� y���	� y��@@��	� y���	� y��@@@@��	� y���	� y��@��	� y���	� y��@���Р"/%��	� z���	� z��@��@����!t��	� z���	� z��@@��	� z���	� z��@@��@����!t��	� z��	� z�@@��	� z��	� z�@@����!t��	� z��	� z�@@��	� z��	� z�@@��	� z��	� z�@@��	� z���	� z�@@@@��	� z���	� z�@��	� z���	� z�@���Р"//��	� {	�	� {	@��@����!t��	� {	�	� {	@@��	� {	�	� {	@@��@����!t��	� {	�	� {	 @@��	� {	�	� {	 @@����%float��
 {	$�
 {	)@@��
 {	$�
 {	)@@��
 {	�
	 {	)@@��
 {	�
 {	)@@@@��
 {	�
 {	)@��
 {	�
 {	)@@��
 k���
 |*/@@���)ocaml.doc	�����	P A sub-module designed to be opened to make working with ints more convenient.  @��
# j>@�
$ j>�@@@��
& j>@�
' j>�@@@��
) k���
* |*/@��
, k���
- |*/@�����*ocaml.text
	�������	* {9 Successor and predecessor functions } @��
= ~13�
> ~1b@@@��
@ ~13�
A ~1b@@��
C ~13�
D ~1b@���Р$succ��
L �dj�
M �dn@��@����!t��
V �dq�
W �dr@@��
Y �dq�
Z �dr@@����!t��
a �dv�
b �dw@@��
d �dv�
e �dw@@��
g �dq�
h �dw@@@@��
j �df�
k �dw@��
m �df�
n �dw@���Р$pred��
v �x~�
w �x�@��@����!t��
� �x��
� �x�@@��
� �x��
� �x�@@����!t��
� �x��
� �x�@@��
� �x��
� �x�@@��
� �x��
� �x�@@@@��
� �xz�
� �x�@��
� �xz�
� �x�@���Р#abs��
� ����
� ���@��@����!t��
� ���
� ��@@��
� ���
� ��@@����!t��
� ���
� ��@@��
� ���
� ��@@��
� ���
� ��@@@���)ocaml.doc
��������	` Returns the absolute value of the argument.  May be negative if the input is
      [min_value] @��
� ����
� ���@@@��
� ����
� ���@@@��
� ����
� ��@��
� ����
� ��@����������%Round��
� �	�
� �	@��
� �	�
� �	@@��    �!t��
� �	#�
� �	$@@@@A�����!t��
� �	(�
� �	)@@��
� �	(�
� �	)@@@��
� �	�
� �	)@@��
� �	�
� �	)@@�� �	� �	)@@�� �	� �	)@���Р#pow�� ���� ���@��@����!t�� ���� ���@@�� ���� ���@@��@����!t��$ ����% ���@@��' ����( ���@@����!t��/ ����0 ���@@��2 ����3 ���@@��5 ����6 ���@@��8 ����9 ���@@@���)ocaml.doc�������	� [pow base exponent] returns [base] raised to the power of [exponent].  It is OK if
      [base <= 0].  [pow] raises if [exponent < 0], or an integer overflow would occur. @��G �+-�H ���@@@��J �+-�K ���@@@��M ����N ���@��P ����Q ���@���Р)max_value��Y �#)�Z �#2@����!t��a �#5�b �#6@@��d �#5�e �#6@@@���)ocaml.doc?�������	# The largest representable integer @��s ����t ��"@@@��v ����w ��"@@@��y �#%�z �#6@��| �#%�} �#6@���Р)min_value��� �dj�� �ds@����!t��� �dv�� �dw@@��� �dv�� �dw@@@���)ocaml.dock�������	$ The smallest representable integer @��� �8:�� �8c@@@��� �8:�� �8c@@@��� �df�� �dw@��� �df�� �dw@�����*ocaml.text��������	" {9 Bit-wise logical operations } @��� �y{�� �y�@@@��� �y{�� �y�@@��� �y{�� �y�@���Р'bit_and��� ����� ���@��@����!t��� ����� ���@@��� ����� ���@@��@����!t��� ����� ���@@��� ����� ���@@����!t��� ����� ���@@��� ����� ���@@��� ����� ���@@��� ����� ���@@@@��� ����� ���@��� ����� ���@���Р&bit_or�� ���� ���@��@����!t�� ���� ���@@�� ���� ���@@��@����!t�� ���� ���@@�� ���� ���@@����!t��$ ����% ���@@��' ����( ���@@��* ����+ ���@@��- ����. ���@@@@��0 ����1 ���@��3 ����4 ���@���Р'bit_xor��< ����= ���@��@����!t��F ����G ���@@��I ����J ���@@��@����!t��S ����T ���@@��V ����W ���@@����!t��^ ����_ ���@@��a ����b ���@@��d ����e ���@@��g ����h ���@@@@��j ����k ���@��m ����n ���@���Р'bit_not��v ����w ��@��@����!t��� ���� ��@@��� ���� ��@@����!t��� ���� ��@@��� ���� ��@@��� ���� ��@@@@��� ����� ��@��� ����� ��@�����*ocaml.textt�������	n {9 Bit-shifting operations }

      The results are unspecified for negative shifts and shifts [>= num_bits] @��� ��� �3�@@@��� ��� �3�@@��� ��� �3�@���Р*shift_left��� ����� ���@��@����!t��� ����� ���@@��� ����� ���@@��@����#int��� ����� ���@@��� ����� ���@@����!t��� ����� ���@@��� ����� ���@@��� ����� ���@@��� ����� ���@@@���)ocaml.doc��������	% shifts left, filling in with zeroes @��� ����� ���@@@��� ����� ���@@@��� ����� ���@��� ����� ���@���Р+shift_right�� �� �@��@����!t�� �"� �#@@�� �"� �#@@��@����#int�� �'� �*@@�� �'� �*@@����!t��% �.�& �/@@��( �.�) �/@@��+ �'�, �/@@��. �"�/ �/@@@���)ocaml.doc	�������	1 shifts right, preserving the sign of the input. @��= ����> ��@@@��@ ����A ��@@@��C ��D �/@��F ��G �/@���Р3shift_right_logical��O ����P ���@��@����!t��Y ����Z ���@@��\ ����] ���@@��@����#int��f ����g ���@@��i ����j ���@@����!t��q ����r ���@@��t ����u ���@@��w ����x ���@@��z ����{ ���@@@���)ocaml.docU�������	[ shifts right, filling in with zeroes, which will not preserve the sign of the
      input @��� �13�� ���@@@��� �13�� ���@@@��� ����� ���@��� ����� ���@�����*ocaml.texto�������	? {9 Increment and decrement functions for integer references } @��� ����� ��@@@��� ����� ��@@��� ����� ��@���Р$decr��� ��� �@��@����#ref��� ��� �@�����!t��� ��� �@@��� ��� �@@@��� ��� �@@����$unit��� ��� �!@@��� ��� �!@@��� ��� �!@@@@��� �	�� �!@��� �	�� �!@���Р$incr��� �"(�� �",@��@����#ref��� �"1�� �"4@�����!t��� �"/�� �"0@@��� �"/�� �"0@@@�� �"/� �"4@@����$unit��	 �"8�
 �"<@@�� �"8� �"<@@�� �"/� �"<@@@@�� �"$� �"<@�� �"$� �"<@�����*ocaml.text򐠠����6 {9 Population count} @��& �>@�' �>[@@@��) �>@�* �>[@@��, �>@�- �>[@���Р(popcount��5 ����6 ���@��@����!t��? ����@ ���@@��B ����C ���@@����#int��J ����K ���@@��M ����N ���@@��P ����Q ���@@@���)ocaml.doc+�������	H returns the number of 1 bits in the binary representation of the input @��_ �]_�` �]�@@@��b �]_�c �]�@@@��e ����f ���@��h ����i ���@�����*ocaml.textE�������	3 {9 Conversion functions to related integer types} @��y ����z ��@@@��| ����} ��@@�� ����� ��@���Р,of_int32_exn��� �
�� �@��@����%int32��� ��� �@@��� ��� �@@����!t��� �"�� �#@@��� �"�� �#@@��� ��� �#@@@@��� ��� �#@��� ��� �#@���Р,to_int32_exn��� �$*�� �$6@��@����!t��� �$9�� �$:@@��� �$9�� �$:@@����%int32��� �$>�� �$C@@��� �$>�� �$C@@��� �$9�� �$C@@@@��� �$&�� �$C@��� �$&�� �$C@���Р,of_int64_exn��� �DJ�� �DV@��@����%int64��� �DY�� �D^@@��� �DY�� �D^@@����!t��� �Db�� �Dc@@��� �Db�� �Dc@@��� �DY�� �Dc@@@@��� �DF�� �Dc@��� �DF�� �Dc@���Р(to_int64�� �dj� �dr@��@����!t�� �du� �dv@@�� �du� �dv@@����%int64�� �dz� �d@@�� �dz� �d@@��! �du�" �d@@@@��$ �df�% �d@��' �df�( �d@���Р0of_nativeint_exn��0 ����1 ���@��@����)nativeint��: ����; ���@@��= ����> ���@@����!t��E ����F ���@@��H ����I ���@@��K ����L ���@@@@��N ����O ���@��Q ����R ���@���Р0to_nativeint_exn��Z ����[ ���@��@����!t��d ����e ���@@��g ����h ���@@����)nativeint��o ����p ���@@��r ����s ���@@��u ����v ���@@@@��x ����y ���@��{ ����| ���@���Р2of_float_unchecked��� ����� ���@��@����%float��� ����� ���@@��� ����� ���@@����!t��� ����� ���@@��� ����� ���@@��� ����� ���@@@���)ocaml.docz�������	� [of_float_unchecked] truncates the given floating point number to an integer,
      rounding towards zero.
      The result is unspecified if the argument is nan or falls outside the range
      of representable integers. @��� ����� ���@@@��� ����� ���@@@��� ����� ���@��� ����� ���@@���q���� ���@@@���q���� ���@���q���� ���@@