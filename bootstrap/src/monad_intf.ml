Caml1999M019����            -monad_intf.ml����  q�  �  M�  L2������&Import��-monad_intf.mlA@F�A@L@@��A@@�A@L@@��A@@�A@L@�����%Basic��CNZ�CN_@������A�    �!t��Dfp�Dfq@����!a��%Dfm�&Dfo@@B@@@A@@��(Dfh�)Dfq@@��+Dfh�,Dfq@���Р$bind��4Erx�5Er|@��@����!t��>Er B�?Er C@���!a��EEr�FEr A@@@��HEr�IEr C@@���!f��@��!a��TEr J�UEr L@@����!t��\Er S�]Er T@���!b��cEr P�dEr R@@@��fEr P�gEr T@@��iEr J�jEr T@@����!t��qEr \�rEr ]@���!b��xEr Y�yEr [@@@��{Er Y�|Er ]@@��~Er G�Er ]@@���Er��Er ]@@@@���Ert��Er ]@���Ert��Er ]@���Р&return���F ^ d��F ^ j@��@��!a���F ^ m��F ^ o@@����!t���F ^ v��F ^ w@���!a���F ^ s��F ^ u@@@���F ^ s��F ^ w@@���F ^ m��F ^ w@@@���)ocaml.doc��&_none_A@ �A�������	� The following identities ought to hold (for some value of =):

      - [return x >>= f = f x]
      - [t >>= fun x -> return x = t]
      - [(t >>= f) >>= g = t >>= fun x -> (f x >>= g)]

     Note: [>>=] is the infix notation for [bind])
  @���G x z��Nmq@@@���G x z��Nmq@@@���F ^ `��F ^ w@���F ^ `��F ^ w@���Р#map���W8>��W8A@����1Define_using_bind@A@��&Custom@@���@����!t���XYv��XYw@���!a���XYs��XYu@@@���XYs��XYw@@���!f��@��!a���XY~��XY�@@��!b�� XY��XY�@@��XY~�XY�@@����!t��XY��XY�@���!b��XY��XY�@@@��XY��XY�@@��XY{�XY�@@��XYs�XY�@@@@@@��W8D�Y��@@@���)ocaml.docq�������
  � The [map] argument to [Monad.Make] says how to implement the monad's [map] function.
      [`Define_using_bind] means to define [map t ~f = bind t ~f:(fun a -> return (f a))].
      [`Custom] overrides the default implementation, presumably with something more
      efficient.

      Some other functions returned by [Monad.Make] are defined in terms of [map], so
      passing in a more efficient [map] will improve their efficiency as well. @��-Psu�.V�7@@@��0Psu�1V�7@@@��3W8:�4Y��@��6W8:�7Y��@@��9CNb�:Z��@@@��<CNN�=Z��@��?CNN�@Z��@�����%Infix��H\���I\��@������A�    �!t��U]���V]��@����!a��]]���^]��@@B@@@A@@��`]���a]��@@��c]���d]��@���Р#>>=��lb���mb��@��@����!t��vb���wb��@���!a��}b���~b��@@@���b����b��@@��@��@��!a���b����b��@@����!t���b����b��@���!b���b����b��@@@���b����b��@@���b����b��@@����!t���b����b��@���!b���b����b��@@@���b����b��@@���b����b��@@���b����b��@@@���)ocaml.doc
�������	� [t >>= f] returns a computation that sequences the computations represented by two
      monad elements.  The resulting computation first does [t] to yield a value [v], and
      then runs the computation returned by [f v]. @���_����a|�@@@���_����a|�@@@���b����b��@���b����b��@���Р#>>|���e��e @��@����!t���e&��e'@���!a���e#��e%@@@���e#��e'@@��@��@��!a���e,��e.@@��!b���e2��e4@@���e,� e4@@����!t��e<�e=@���!b��e9�e;@@@��e9�e=@@��e+�e=@@��e#�e=@@@���)ocaml.docj�������	/ [t >>| f] is [t >>= (fun a -> return (f a))]. @��&d���'d�@@@��)d���*d�@@@��,e�-e=@��/e�0e=@@��2\���3f>A@@@��5\���6f>A@��8\���9f>A@�����&Syntax��Aj���Bj��@������A�    �!t��Nk��Ok�@����!a��Vk��Wk�@@B@@@A@@��Yk���Zk�@@��\k���]k�@�����*Let_syntax��el�fl@�������*ocaml.text��������	E These are convenient to have in scope when programming with a monad @��xn!%�yn!o@@@��{n!%�|n!o@@��~n!%�n!o@���Р&return���pqy��pq@��@��!a���pq���pq�@@����!t���pq���pq�@���!a���pq���pq�@@@���pq���pq�@@���pq���pq�@@@@���pqu��pq�@���pqu��pq�@����������%Infix���q����q��@���q����q��@@��    �!t���q����q��@����!a���q����q��@@B@@@A�����!t���q����q��@���!a���q����q��@@@���q����q��@@@���q����q��@@���q����q��@@���q����q��@@���q����q��@�����*Let_syntax���s����s��@�����Р&return���t����t��@��@��!a��t���t��@@����!t��t���t��@���!a��t���t��@@@��t���t��@@��t���t��@@@@��t���t��@��!t���"t��@���Р$bind��*u���+u��@��@����!t��4u��5u�@���!a��;u��<u�@@@��>u��?u�@@���!f��@��!a��Ju��Ku�@@����!t��Ru��Su�@���!b��Yu��Zu�@@@��\u��]u�@@��_u��`u�@@����!t��gu��hu� @���!b��nu��ou�@@@��qu��ru� @@��tu�
�uu� @@��wu��xu� @@@@��zu���{u� @��}u���~u� @���Р#map���v!+��v!.@��@����!t���v!5��v!6@���!a���v!2��v!4@@@���v!2��v!6@@���!f��@��!a���v!=��v!?@@��!b���v!C��v!E@@���v!=��v!E@@����!t���v!O��v!P@���!b���v!L��v!N@@@���v!L��v!P@@���v!:��v!P@@���v!2��v!P@@@@���v!'��v!P@���v!'��v!P@���Р$both���wQ[��wQ_@��@����!t���wQe��wQf@���!a���wQb��wQd@@@���wQb��wQf@@��@����!t���wQm��wQn@���!b���wQj��wQl@@@���wQj��wQn@@����!t��wQ|�wQ}@������!a��wQs�wQu@@���!b��wQx�wQz@@@��wQs�wQz@@@��wQr�wQ}@@�� wQj�!wQ}@@��#wQb�$wQ}@@@@��&wQW�'wQ}@��)wQW�*wQ}@�����+Open_on_rhs��2x~��3x~�@��@��7x~��8x~�@@@��:x~��;x~�@��=x~��>x~�@@��@s���Ay��@@@��Cs���Dy��@��Fs���Gy��@@��Il�Jz��@@@��Ll�Mz��@��Ol�Pz��@@��Rj���S{��@@���)ocaml.doc��������	� opening a module of this type allows one to use the [%bind] and [%map] syntax
    extensions defined by ppx_let, as well as brings [return] into scope @��ahCC�bi��@@@��dhCC�ei��@@@��gj���h{��@��jj���k{��@�����0S_without_syntax��s A���t A�	
@������A�    �!t��� D	�	��� D	�	�@����!a��� D	�	��� D	�	�@@B@@@A@���)ocaml.docې������	� A monad is an abstraction of the concept of sequencing of computations.  A value of
      type 'a monad represents a computation that returns a value of type 'a. @��� B		�� C	k	�@@@��� B		�� C	k	�@@@��� D	�	��� D	�	�@@��� D	�	��� D	�	�@����������%Infix��� E	�	��� E	�	�@��� E	�	��� E	�	�@@��    �!t��� E	�	��� E	�	�@����!a��� E	�	��� E	�	�@@B@@@A�����!t��� E	�	��� E	�	�@���!a��� E	�	��� E	�	�@@@��� E	�	��� E	�	�@@@��� E	�	��� E	�	�@@��� E	�	��� E	�	�@@��� E	�	��� E	�	�@@��� E	�	��� E	�	�@�����+Monad_infix��� G	�	��� G	�
@������%Infix��� G	�
�� G	�
@��� G	�
�� G	�
@@��    �!t��� G	�
�� G	�
@����!a�� G	�
� G	�
@@B@@@A�����!t�� G	�
$� G	�
%@���!a�� G	�
!� G	�
#@@@�� G	�
!� G	�
%@@@�� G	�
� G	�
%@@�� G	�
�  G	�
%@@@��" G	�	��# G	�
%@��% G	�	��& G	�
%@���Р$bind��. J
H
N�/ J
H
R@��@����!t��8 J
H
X�9 J
H
Y@���!a��? J
H
U�@ J
H
W@@@��B J
H
U�C J
H
Y@@���!f��@��!a��N J
H
`�O J
H
b@@����!t��V J
H
i�W J
H
j@���!b��] J
H
f�^ J
H
h@@@��` J
H
f�a J
H
j@@��c J
H
`�d J
H
j@@����!t��k J
H
r�l J
H
s@���!b��r J
H
o�s J
H
q@@@��u J
H
o�v J
H
s@@��x J
H
]�y J
H
s@@��{ J
H
U�| J
H
s@@@���)ocaml.docΐ������9 [bind t ~f] = [t >>= f] @��� I
'
)�� I
'
G@@@��� I
'
)�� I
'
G@@@��� J
H
J�� J
H
s@��� J
H
J�� J
H
s@���Р&return��� M
�
��� M
�
�@��@��!a��� M
�
��� M
�
�@@����!t��� M
�
��� M
�
�@���!a��� M
�
��� M
�
�@@@��� M
�
��� M
�
�@@��� M
�
��� M
�
�@@@���)ocaml.doc�������	> [return v] returns the (trivial) computation that returns v. @��� L
u
w�� L
u
�@@@��� L
u
w�� L
u
�@@@��� M
�
��� M
�
�@��� M
�
��� M
�
�@���Р#map��� P
�
��� P
�
�@��@����!t��� P
��� P
�@���!a��� P
��� P
�@@@��� P
��� P
�@@���!f��@��!a��� P
��� P
�@@��!b��  P
�� P
�@@�� P
�� P
�@@����!t�� P
�� P
�@���!b�� P
�� P
�@@@�� P
�� P
�@@�� P
�
� P
�@@�� P
�� P
�@@@���)ocaml.docn�������8 [map t ~f] is t >>| f. @��* O
�
��+ O
�
�@@@��- O
�
��. O
�
�@@@��0 P
�
��1 P
�@��3 P
�
��4 P
�@���Р$join��< SMS�= SMW@��@����!t��F SM_�G SM`@�����!t��O SM]�P SM^@���!a��V SMZ�W SM\@@@��Y SMZ�Z SM^@@@��\ SMZ�] SM`@@����!t��d SMg�e SMh@���!a��k SMd�l SMf@@@��n SMd�o SMh@@��q SMZ�r SMh@@@���)ocaml.docĐ������	% [join t] is [t >>= (fun t' -> t')]. @��� R "�� R L@@@��� R "�� R L@@@��� SMO�� SMh@��� SMO�� SMh@���Р(ignore_m��� Yz��� Yz�@��@����!t��� Yz��� Yz�@���!a��� Yz��� Yz�@@@��� Yz��� Yz�@@����!t��� Yz��� Yz�@�����$unit��� Yz��� Yz�@@��� Yz��� Yz�@@@��� Yz��� Yz�@@��� Yz��� Yz�@@@���)ocaml.doc�������
   [ignore_m t] is [map t ~f:(fun _ -> ())].  [ignore_m] used to be called [ignore],
      but we decided that was a bad name, because it shadowed the widely used
      [Pervasives.ignore].  Some monads still do [let ignore = ignore_m] for historical
      reasons. @��� Ujl�� Xhy@@@��� Ujl�� Xhy@@@��� Yz|�� Yz�@��� Yz|�� Yz�@���Р#all��� [���� [��@��@����$list��� [���� [��@�����!t��� [���� [��@���!a��� [���� [��@@@��� [���� [��@@@�� [��� [��@@����!t��	 [���
 [��@�����$list�� [��� [��@���!a�� [��� [��@@@�� [��� [��@@@�� [���  [��@@��" [���# [��@@@@��% [���& [��@��( [���) [��@���Р*all_ignore��1 \���2 \��@��@����$list��; \���< \��@�����!t��D \���E \��@�����$unit��M \���N \��@@��P \���Q \��@@@��S \���T \��@@@��V \���W \��@@����!t��^ \���_ \��@�����$unit��g \���h \��@@��j \���k \��@@@��m \���n \��@@��p \���q \��@@@@��s \���t \��@��v \���w \��@@��y A�	�z ]��@@@��| A���} ]��@�� A���� ]��@�����!S��� _���� _��@������A�    �!t��� ` 
�� ` @����!a��� ` �� ` 	@@B@@@A@@��� ` �� ` @@��� ` �� ` @����������0S_without_syntax��� a�� a&@��� a�� a&@@��    �!t��� a4�� a5@����!a��� a1�� a3@@B@@@A�����!t��� a<�� a=@���!a��� a9�� a;@@@��� a9�� a=@@@��� a,�� a=@@��� a�� a=@@��� a�� a=@@��� a�� a=@����������&Syntax��� b>H�� b>N@��� b>H�� b>N@@��    �!t��� b>f�� b>g@����!a�� b>c� b>e@@B@@@A�����!t�� b>n� b>o@���!a�� b>k� b>m@@@�� b>k� b>o@@@�� b>^� b>o@@�� b>H� b>o@@��  b>@�! b>o@@��# b>@�$ b>o@@��& _���' cps@@@��) _���* cps@��, _���- cps@�����&Basic2��5 k?K�6 k?Q@������A�    �!t��B lXh�C lXi@����!a��J lX`�K lXb@@B����!e��R lXd�S lXf@@B@@@A@@��U lXZ�V lXi@@��X lXZ�Y lXi@���Р$bind��a mjp�b mjt@��@����!t��k mj��l mj�@���!a��r mjx�s mjz@@���!e��y mj|�z mj~@@@��| mjw�} mj�@@���!f��@��!a��� mj��� mj�@@����!t��� mj��� mj�@���!b��� mj��� mj�@@���!e��� mj��� mj�@@@��� mj��� mj�@@��� mj��� mj�@@����!t��� mj��� mj�@���!b��� mj��� mj�@@���!e��� mj��� mj�@@@��� mj��� mj�@@��� mj��� mj�@@��� mjw�� mj�@@@@��� mjl�� mj�@��� mjl�� mj�@���Р#map��� n���� n��@����1Define_using_bind@A@��&Custom@@���@����!t��� o���� o��@���!a��� o���� o��@@���!e��� o���� o��@@@��� o���� o��@@���!f��@��!a��	 o���	 o��@@��!b��	 o���		 o��@@��	 o���	 o��@@����!t��	 o�
�	 o�@���!b��	 o��	 o�@@���!e��	! o��	" o�@@@��	$ o��	% o�@@��	' o���	( o�@@��	* o���	+ o�@@@@@@��	- n���	. p@@@@��	0 n���	1 p@��	3 n���	4 p@���Р&return��	< q!�	= q'@��@��!a��	D q*�	E q,@@����!t��	L q8�	M q9@���!a��	S q1�	T q3@@��@��	X q5�	Y q6@@@��	[ q0�	\ q9@@��	^ q*�	_ q9@@@@��	a q�	b q9@��	d q�	e q9@@��	g k?T�	h r:=@@���)ocaml.doc��������	�
   Multi parameter monad.
   The second parameter get unified across all the computation. This is used
   to encode monads working on a multi parameter data structure like
   ([('a,'b result)]).
@��	v euu�	w j<>@@@��	y euu�	z j<>@@@��	| k??�	} r:=@��	 k??�	� r:=@�����&Infix2��	� v���	� v��@������A�    �!t��	� w���	� w��@����!a��	� w���	� w��@@B����!e��	� w���	� w��@@B@@@A@@��	� w���	� w��@@��	� w���	� w��@���Р#>>=��	� x���	� x��@��@����!t��	� x���	� x��@���!a��	� x���	� x��@@���!e��	� x���	� x��@@@��	� x���	� x��@@��@��@��!a��	� x���	� x��@@����!t��	� x��	� x�@���!b��	� x���	� x��@@���!e��	� x���	� x�@@@��	� x���	� x�@@��	� x���	� x�@@����!t��	� x��	� x�@���!b��
 x�
�
 x�@@���!e��
 x��
 x�@@@��
 x�	�
 x�@@��
 x���
 x�@@��
 x���
 x�@@@@��
 x���
 x�@��
 x���
 x�@���Р#>>|��
# y�
$ y@��@����!t��
- y+�
. y,@���!a��
4 y#�
5 y%@@���!e��
; y'�
< y)@@@��
> y"�
? y,@@��@��@��!a��
H y1�
I y3@@��!b��
N y7�
O y9@@��
Q y1�
R y9@@����!t��
Y yG�
Z yH@���!b��
` y?�
a yA@@���!e��
g yC�
h yE@@@��
j y>�
k yH@@��
m y0�
n yH@@��
p y"�
q yH@@@@��
s y�
t yH@��
v y�
w yH@@��
y v���
z zIL@@���)ocaml.doc	̐������	g Same as Infix, except the monad type has two arguments. The second is always just
    passed through. @��
� t??�
� u��@@@��
� t??�
� u��@@@��
� v���
� zIL@��
� v���
� zIL@�����'Syntax2��
� |NZ�
� |Na@������A�    �!t��
� }hx�
� }hy@����!a��
� }hp�
� }hr@@B����!e��
� }ht�
� }hv@@B@@@A@@��
� }hj�
� }hy@@��
� }hj�
� }hy@�����*Let_syntax��
� {��
� {�@�����Р&return��
� ����
� ���@��@��!a��
� ����
� ���@@����!t��
� ����
� ���@���!a��
� ����
� ���@@���!e��
� ����
� ���@@@��
� ����
� ���@@��
� ����
� ���@@@@��
� ����
� ���@��
� ����
� ���@����������&Infix2��	 ����
 ���@�� ���� ���@@��    �!t�� ���� ���@����!a�� ���� ���@@B����!e��$ ����% ���@@B@@@A�����!t��- ����. ���@���!a��4 ����5 ���@@���!e��; ����< ���@@@��> ����? ���@@@��A ����B ���@@��D ����E ���@@��G ����H ���@@��J ����K ���@�����*Let_syntax��S ����T �� @�����Р&return��^ ��_ �@��@��!a��f ��g �@@����!t��n �)�o �*@���!a��u �!�v �#@@���!e��| �%�} �'@@@�� � �� �*@@��� ��� �*@@@@��� ��� �*@��� ��� �*@���Р$bind��� �+5�� �+9@��@����!t��� �+E�� �+F@���!a��� �+=�� �+?@@���!e��� �+A�� �+C@@@��� �+<�� �+F@@���!f��@��!a��� �+M�� �+O@@����!t��� �+\�� �+]@���!b��� �+T�� �+V@@���!e��� �+X�� �+Z@@@��� �+S�� �+]@@��� �+M�� �+]@@����!t��� �+k�� �+l@���!b��� �+c�� �+e@@���!e��� �+g�� �+i@@@��� �+b�� �+l@@��� �+J�� �+l@@��� �+<�� �+l@@@@��� �+1�� �+l@��� �+1�� �+l@���Р#map�� �mw� �mz@��@����!t�� �m�� �m�@���!a�� �m� �m�@@���!e�� �m�� �m�@@@�� �m~� �m�@@���!f��@��!a��) �m��* �m�@@��!b��/ �m��0 �m�@@��2 �m��3 �m�@@����!t��: �m��; �m�@���!b��A �m��B �m�@@���!e��H �m��I �m�@@@��K �m��L �m�@@��N �m��O �m�@@��Q �m~�R �m�@@@@��T �ms�U �m�@��W �ms�X �m�@���Р$both��` ����a ���@��@����!t��j ����k ���@���!a��q ����r ���@@���!e��x ����y ���@@@��{ ����| ���@@��@����!t��� ����� ���@���!b��� ����� ���@@���!e��� ����� ���@@@��� ����� ���@@����!t��� ����� ���@������!a��� ����� ���@@���!b��� ����� ���@@@��� ����� ���@@���!e��� ����� ���@@@��� ����� ���@@��� ����� ���@@��� ����� ���@@@@��� ����� ���@��� ����� ���@�����+Open_on_rhs��� ����� ��@��@��� ���� ��@@@��� ����� ��@��� ����� ��@@��� ���� �@@@��� ����� �@��� ����� �@@��� {��� �@@@��� {}�� �@��� {}�� �@@��� |Nd�� �!@@@��� |NN�� �!@��� |NN�� �!@�����"S2��  ���� ���@������A�    �!t�� ���� ���@����!a�� ���� ���@@B����!e�� ���� ���@@B@@@A@@��  ����! ���@@��# ����$ ���@����������&Infix2��1 ����2 ���@��4 ����5 ���@@��    �!t��< ����= ���@����!a��D ����E ���@@B����!e��L ����M ���@@B@@@A�����!t��U ����V ���@���!a��\ ����] ���@@���!e��c ����d ���@@@��f ����g ���@@@��i ����j ���@@��l ����m ���@@��o ����p ���@@��r ����s ���@����������'Syntax2��� ����� ���@��� ����� ���@@��    �!t��� ���� ��@����!a��� ���� ��
@@B����!e��� ���� ��@@B@@@A�����!t��� ���� ��@���!a��� ���� ��@@���!e��� ���� ��@@@��� ���� ��@@@��� ���� ��@@��� ����� ��@@��� ����� ��@@��� ����� ��@�����+Monad_infix��� �!*�� �!5@������&Infix2��� �!8�� �!>@��� �!8�� �!>@@��    �!t��� �!R�� �!S@����!a��� �!J�� �!L@@B����!e��� �!N�� �!P@@B@@@A�����!t��� �!`�� �!a@���!a��� �!X�  �!Z@@���!e�� �!\� �!^@@@��	 �!W�
 �!a@@@�� �!D� �!a@@�� �!8� �!a@@@�� �!#� �!a@�� �!#� �!a@���Р$bind�� �ci� �cm@��@����!t��( �cy�) �cz@���!a��/ �cq�0 �cs@@���!e��6 �cu�7 �cw@@@��9 �cp�: �cz@@���!f��@��!a��E �c��F �c�@@����!t��M �c��N �c�@���!b��T �c��U �c�@@���!e��[ �c��\ �c�@@@��^ �c��_ �c�@@��a �c��b �c�@@����!t��i �c��j �c�@���!b��p �c��q �c�@@���!e��w �c��x �c�@@@��z �c��{ �c�@@��} �c~�~ �c�@@��� �cp�� �c�@@@@��� �ce�� �c�@��� �ce�� �c�@���Р&return��� ����� ���@��@��!a��� ����� ���@@����!t��� ����� ���@���!a��� ����� ���@@��@��� ����� ���@@@��� ����� ���@@��� ����� ���@@@@��� ����� ���@��� ����� ���@���Р#map��� ����� ���@��@����!t��� ����� ���@���!a��� ����� ���@@���!e��� ����� ���@@@��� ����� ���@@���!f��@��!a��� ����� ���@@��!b��� ����� ���@@��� ����� ���@@����!t��� ����� ���@���!b��� ����  ���@@���!e�� ���� ���@@@��	 ����
 ���@@�� ���� ���@@�� ���� ���@@@@�� ���� ���@�� ���� ���@���Р$join�� ���� ��@��@����!t��( ���) ��@�����!t��1 ���2 ��@���!a��8 ���9 ��	@@���!e��? ���@ ��@@@��B ���C ��@@���!e��I ���J ��@@@��L ���M ��@@����!t��T ��$�U ��%@���!a��[ ���\ ��@@���!e��b �� �c ��"@@@��e ���f ��%@@��h ���i ��%@@@@��k ����l ��%@��n ����o ��%@���Р(ignore_m��w �'-�x �'5@��@����!t��� �'@�� �'A@��@��� �'9�� �':@@���!e��� �'<�� �'>@@@��� �'8�� �'A@@����!t��� �'P�� �'Q@�����$unit��� �'F�� �'J@@��� �'F�� �'J@@���!e��� �'L�� �'N@@@��� �'E�� �'Q@@��� �'8�� �'Q@@@@��� �')�� �'Q@��� �')�� �'Q@���Р#all��� �SY�� �S\@��@����$list��� �Sj�� �Sn@�����!t��� �Sh�� �Si@���!a��� �S`�� �Sb@@���!e��� �Sd�� �Sf@@@��� �S_�� �Si@@@��� �S_�� �Sn@@����!t��� �S��� �S�@�����$list��� �Sv�� �Sz@���!a��� �Ss�  �Su@@@�� �Ss� �Sz@@���!e��	 �S|�
 �S~@@@�� �Sr� �S�@@�� �S_� �S�@@@@�� �SU� �S�@�� �SU� �S�@���Р*all_ignore�� ���� ���@��@����$list��( ����) ���@�����!t��1 ����2 ���@�����$unit��: ����; ���@@��= ����> ���@@���!e��D ����E ���@@@��G ����H ���@@@��J ����K ���@@����!t��R ����S ���@�����$unit��[ ����\ ���@@��^ ����_ ���@@���!e��e ����f ���@@@��h ����i ���@@��k ����l ���@@@@��n ����o ���@��q ����r ���@@��t ����u ���@@���)ocaml.docǐ������	f The same as S except the monad type has two arguments. The second is always just
    passed through. @��� �##�� �x�@@@��� �##�� �x�@@@��� ����� ���@��� ����� ���@�����'S_to_S2��� ����� ���@���!X��� ����� ���@�����!S��� ����� ���@��� ����� ���@@�������A�    �!t��� ��� �@����!a��� �
�� �@@B����!e��� ��� �@@B@@@A������!X!t��� ��� �@���!a��� ��� �@@@��� ��� �@@@��� ��� �@@��� ��� �@����������!X��� �(�� �)@��� �(�� �)@@������!S��� �,�� �-@��� �,�  �-@@��    �!t�� �;� �<@����!a�� �8� �:@@B@@@A������!X!t�� �C� �F@���!a��! �@�" �B@@@��$ �@�% �F@@@��' �3�( �F@@��* �,�+ �F@@��- �'�. �G@@��0 ��1 �G@@��3 ��4 �G@@��6 ����7 �HK@@������"S2��@ ����A ���@��C ����D ���@@����!t��K ����L ���@    ���P ����Q ���@����!a��X ����Y ���@@B����!e��` ����a ���@@B@@@A������!X!t��k ����l ���@���!a��r ����s ���@@@��u ����v ���@@@��x ����y ���@@��{ ����| ���@@��~ ���� �HK@@��� ����� �HK@@@��� ����� �HK@��� ����� �HK@�����%Monad��� �MY�� �M^@��������%Basic��� �ft�� �fy@�����%Basic��� �f~�� �f�@��� �f~�� �f�@@@��� �fh�� �f�@��� �fh�� �f�@�����&Basic2��� ����� ���@�����&Basic2��� ����� ���@��� ����� ���@@@��� ����� ���@��� ����� ���@�����%Infix��� ����� ���@�����%Infix��� ����� ���@��� ����� ���@@@��� ����� ���@��� ����� ���@�����&Infix2��� ����� ���@�����&Infix2��� ����� ���@��� ����� ���@@@��� ����� ���@��� ����  ���@�����&Syntax�� ����	 ���@�����&Syntax�� ���� ���@�� ���� ���@@@�� ���� ���@�� ���� ���@�����'Syntax2��# ���$ ��@�����'Syntax2��, ���- ��@��/ ���0 ��@@@��2 ���3 ��@��5 ���6 ��@�����0S_without_syntax��> �-�? �=@�����0S_without_syntax��G �@�H �P@��J �@�K �P@@@��M �!�N �P@��P �!�Q �P@�����!S��Y �Q_�Z �Q`@�����!S��b �Qi�c �Qj@��e �Qi�f �Qj@@@��h �QS�i �Qj@��k �QS�l �Qj@�����"S2��t �ky�u �k{@�����"S2��} �k��~ �k�@��� �k��� �k�@@@��� �km�� �k�@��� �km�� �k�@�����$Make��� ����� ���@���!X��� ����� ���@�����%Basic��� ����� ���@��� ����� ���@@������!S��� ����� ���@��� ����� ���@@��    �!t��� ����� ���@����!a��� ����� ���@@B@@@A������!X!t��� ����� ���@���!a��� ����� ���@@@��� ����� ���@@@��� ����� ���@@��� ����� ���@@��� ����� ���@@@��� ����� ���@��� ����� ���@�����%Make2��� ����� ���@���!X��� ����� ���@�����&Basic2��� ����� ���@��� ����  ���@@������"S2��	 ����
 ���@�� ���� ���@@��    �!t�� ��� ��@����!a�� ���� ���@@B����!e��$ ����% ���@@B@@@A������!X!t��/ ���0 ��@���!a��6 ���7 ��	@@���!e��= ���> ��@@@��@ ���A ��@@@��C ����D ��@@��F ����G ��@@��I ����J ��@@@��L ����M ��@��O ����P ��@�����%Ident��X ��Y �"@������!S��b �%�c �&@��e �%�f �&@@����!t��m �4�n �5@    ���r �4�s �5@����!a��z �1�{ �3@@B@@@A���!a��� �8�� �:@@@��� �,�� �:@@��� �%�� �:@@@��� ��� �:@��� ��� �:@@��� �Ma�� �;>@@@��� �MM�� �;>@��� �MM�� �;>@@