Caml1999M019����            ,info_intf.ml����  3�  �   p  ������*ocaml.text��&_none_A@ �A�������
  � [Info] is a library for lazily constructing human-readable information as a string or
    sexp, with a primary use being error messages.  Using [Info] is often preferable to
    [sprintf] or manually constructing strings because you don't have to eagerly construct
    the string --- you only need to pay when you actually want to display the info.  which
    for many applications is rare.  Using [Info] is also better than creating custom
    exceptions because you have more control over the format.

    Info is intended to be constructed in the following style; for simple info, you write:

    {[Info.of_string "Unable to find file"]}

    Or for a more descriptive [Info] without attaching any content (but evaluating the
    result eagerly):

    {[Info.createf "Process %s exited with code %d" process exit_code]}

    For info where you want to attach some content, you would write:

    {[Info.create "Unable to find file" filename <:sexp_of< string >>]}

    Or even,

    {[
    Info.create "price too big" (price, [`Max max_price])
      (<:sexp_of< float * [`Max of float] >>)
    ]}

    Note that an [Info.t] can be created from any arbritrary sexp with [Info.t_of_sexp].
@��,info_intf.mlA@@�]��@@@��A@@�]��@@��A@@�]��@������&Import��_���_��@@��_���_��@@��_���_��@�����!S�� a���!a��@������A�    �!t��-d�.d@@@@A@���)ocaml.doc?�������	6 Serialization and comparison force the lazy message. @��<c���=c�@@@��?c���@c�@@@��Bd�Cd7@@��Ed�Fd7@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexp5��@������'Sexplib$Sexp!t@@@@����ED@D@D@@@//���Р)sexp_of_tJ��@����QP@P@������'Sexplib$Sexp!tY@Y@Y@@@DD���Р+hash_fold_t_��@�����$Hash%stateh@h@��@����on@n@�����s@s@s@s@@@^^���Р$hashy��@�����@@�����*hash_value�@�@�@@@pp���Р'compare���@������@�@��@������@�@����#int�@�@�@�@@@��@�@�@������������.Invariant_intf!S���f9C��f9S@���f9C��f9S@@��    �!t���f9^��f9_@@@@A�����!t���f9c��f9d@@���f9c��f9d@@@���f9Y��f9d@@���f9C��f9d@@���f9;��f9d@@���f9;��f9d@���Р-to_string_hum��p���p��@��@����!t��p���p��@@��p���p��@@����&string��p���p�@@��p���p�@@��p���p�@@@���)ocaml.doc/�������
  t [to_string_hum] forces the lazy message, which might be an expensive operation.

      [to_string_hum] usually produces a sexp; however, it is guaranteed that [to_string_hum
      (of_string s) = s].

      If this string is going to go into a log file, you may find it useful to ensure that
      the string is only one line long.  To do this, use [to_string_mach t].
  @��,hfh�-o��@@@��/hfh�0o��@@@��2p���3p�@��5p���6p�@���Р.to_string_mach��>sIO�?sI]@��@����!t��HsI`�IsIa@@��KsI`�LsIa@@����&string��SsIe�TsIk@@��VsIe�WsIk@@��YsI`�ZsIk@@@���)ocaml.dock�������	< [to_string_mach t] outputs [t] as a sexp on a single-line. @��hr�irH@@@��kr�lrH@@@��nsIK�osIk@��qsIK�rsIk@���Р8to_string_hum_deprecated��zz39�{z3Q@��@����!t���z3T��z3U@@���z3T��z3U@@����&string���z3Y��z3_@@���z3Y��z3_@@���z3T��z3_@@@���)ocaml.doc��������	� old version (pre 109.61) of [to_string_hum] that some applications rely on.

      Calls should be replaced with [to_string_mach t], which outputs more parenthesis and
      backslashes.
  @���umo��y.2@@@���umo��y.2@@@���z35��z3_@���z35��z3_@���Р)of_string��� A	m	s�� A	m	|@��@����&string��� A	m	�� A	m	�@@��� A	m	�� A	m	�@@����!t��� A	m	��� A	m	�@@��� A	m	��� A	m	�@@��� A	m	�� A	m	�@@@@��� A	m	o�� A	m	�@��� A	m	o�� A	m	�@���Р'of_lazy��� E
$
*�� E
$
1@��@�����$Lazy!t��� E
$
<�� E
$
B@�����&string��� E
$
5�� E
$
;@@��� E
$
5�� E
$
;@@@��� E
$
5�� E
$
B@@����!t�� E
$
I� E
$
J@@�� E
$
I� E
$
J@@��	 E
$
5�
 E
$
J@@@���)ocaml.doc�������	� Be careful that the body of the lazy or thunk does not access mutable data, since it
      will only be called at an undetermined later point. @�� C	�	�� D	�
#@@@�� C	�	�� D	�
#@@@�� E
$
&� E
$
J@��! E
$
&�" E
$
J@���Р(of_thunk��* F
K
Q�+ F
K
Y@��@��@����$unit��6 F
K
]�7 F
K
a@@��9 F
K
]�: F
K
a@@����&string��A F
K
e�B F
K
k@@��D F
K
e�E F
K
k@@��G F
K
]�H F
K
k@@����!t��O F
K
p�P F
K
q@@��R F
K
p�S F
K
q@@��U F
K
\�V F
K
q@@@@��X F
K
M�Y F
K
q@��[ F
K
M�\ F
K
q@���Р&create��d L���e L��@���$here�����5Source_code_position0!t��r M���s M��@@��u M���v M��@@���&strict����$unit��� N��� N�@@��� N��� N�@@��@����&string��� O�� O@@��� O�� O@@��@��!a��� P&�� P(@@��@��@��!a��� Q)1�� Q)3@@�����$Sexp!t��� Q)7�� Q)=@@��� Q)7�� Q)=@@��� Q)1�� Q)=@@����!t��� R?F�� R?G@@��� R?F�� R?G@@��� Q)0�� R?G@@��� P&�� R?G@@��� O�� R?G@@��� N��� R?G@@��� M���� R?G@@@���)ocaml.docߐ������
  J For [create message a sexp_of_a], [sexp_of_a a] is lazily computed, when the info is
      converted to a sexp.  So, if [a] is mutated in the time between the call to [create]
      and the sexp conversion, those mutations will be reflected in the sexp.  Use
      [~strict:()] to force [sexp_of_a a] to be computed immediately. @��� H
s
u�� K|�@@@��� H
s
u�� K|�@@@��� L���� R?G@��� L���� R?G@���Р(create_s��� TIO�� TIW@��@�����$Sexp!t��� TIZ�� TI`@@��� TIZ�� TI`@@����!t�� TId� TIe@@�� TId�	 TIe@@�� TIZ� TIe@@@@�� TIK� TIe@�� TIK� TIe@���Р'createf�� X��� X��@��@����'format4��$ X���% X� @���!a��+ X���, X��@@�����$unit��4 X���5 X��@@��7 X���8 X��@@�����&string��@ X���A X��@@��C X���D X��@@�����!t��L X���M X��@@��O X���P X��@@@��R X���S X� @@��!a��X X��Y X�@@��[ X���\ X�@@@���)ocaml.docm�������	d Construct a [t] containing only a string from a format.  This eagerly constructs
      the string. @��j Vgi�k W��@@@��m Vgi�n W��@@@��p X���q X�@��s X���t X�@���Р#tag��| [,2�} [,5@��@����!t��� [,8�� [,9@@��� [,8�� [,9@@���#tag����&string��� [,A�� [,G@@��� [,A�� [,G@@����!t��� [,K�� [,L@@��� [,K�� [,L@@��� [,=�� [,L@@��� [,8�� [,L@@@���)ocaml.doc��������< Add a string to the front. @��� Z
�� Z+@@@��� Z
�� Z+@@@��� [,.�� [,L@��� [,.�� [,L@���Р'tag_arg��� ^���� ^��@��@����!t��� ^���� ^��@@��� ^���� ^��@@��@����&string��� ^���� ^��@@��� ^���� ^��@@��@��!a��� ^���� ^��@@��@��@��!a��� ^���� ^��@@�����$Sexp!t��  ^��� ^��@@�� ^��� ^��@@�� ^��� ^��@@����!t�� ^��� ^��@@�� ^��� ^��@@�� ^��� ^��@@�� ^��� ^��@@�� ^��� ^��@@�� ^��� ^��@@@���)ocaml.doc/�������	O Add a string and some other data in the form of an s-expression at the front. @��, ]NP�- ]N�@@@��/ ]NP�0 ]N�@@@��2 ^���3 ^��@��5 ^���6 ^��@���Р'of_list��> a�? a@���+trunc_after����#int��J a%�K a(@@��M a%�N a(@@��@����$list��W a.�X a2@�����!t��` a,�a a-@@��c a,�d a-@@@��f a,�g a2@@����!t��n a6�o a7@@��q a6�r a7@@��t a,�u a7@@��w a�x a7@@@���)ocaml.doc��������	! Combine multiple infos into one @��� `���� `�@@@��� `���� `�@@@��� a
�� a7@��� a
�� a7@���Р&of_exn��� e���� e��@���)backtrace����#Get@A@��$This@@�����&string��� e��� e�@@��� e��� e�@@@@@@��� e���� e�@@��@����#exn��� e��� e�@@��� e��� e�@@����!t��� e��� e�@@��� e��� e�@@��� e��� e�@@��� e���� e�@@@���)ocaml.doc㐠�����	� [of_exn] and [to_exn] are primarily used with [Error], but their definitions have to
     be here because they refer to the underlying representation. @��� c9;�� d��@@@��� c9;�� d��@@@��� e���� e�@��� e���� e�@���Р&to_exn��� f �� f&@��@����!t��� f)�� f*@@��� f)�  f*@@����#exn�� f.� f1@@��
 f.� f1@@�� f)� f1@@@@�� f� f1@�� f� f1@���Р"pp�� h39� h3;@��@�����&Format)formatter��( h3>�) h3N@@��+ h3>�, h3N@@��@����!t��5 h3R�6 h3S@@��8 h3R�9 h3S@@����$unit��@ h3W�A h3[@@��C h3W�D h3[@@��F h3R�G h3[@@��I h3>�J h3[@@@@��L h35�M h3[@��O h35�P h3[@�����-Internal_repr��X j]f�Y j]s@�������A�    �$info��f kz��g kz�@@@@A�����!t��o kz��p kz�@@��r kz��s kz�@@@��u kz~�v kz�@@��x kz~�y kz�@���A�    �!t��� o�� o@@@��Р3Could_not_construct��� p$�� p7@�������$Sexp!t��� p;�� pA@@��� p;�� pA@@@@��� p"�� pA@@�Р&String��� qBJ�� qBP@������&string��� qBa�� qBg@@��� qBa�� qBg@@@@��� qBH�� qBg@@�Р#Exn��� rhp�� rhs@������#exn��� rh��� rh�@@��� rh��� rh�@@@@��� rhn�� rh�@@�Р$Sexp��� s���� s��@�������$Sexp!t��� s���� s��@@��� s���� s��@@@@��� s���� s��@@�Р(Tag_sexp��� t���� t��@������&string��� t���� t��@@��� t���� t��@@������$Sexp!t�� t��� t��@@�� t��� t��@@�����&option�� t��� t� @������5Source_code_position0!t�� t��� t��@@�� t��� t��@@@�� t���  t� @@@@��" t���# t� @@�Р%Tag_t��) u	�* u@������&string��3 u �4 u&@@��6 u �7 u&@@�����!t��? u)�@ u*@@��B u)�C u*@@@@��E u�F u*@@�Р'Tag_arg��L v+3�M v+:@������&string��V v+J�W v+P@@��Y v+J�Z v+P@@������$Sexp!t��d v+S�e v+Y@@��g v+S�h v+Y@@�����!t��p v+\�q v+]@@��s v+\�t v+]@@@@��v v+1�w v+]@@�Р'Of_list��} w^f�~ w^m@������&option��� w^��� w^�@�����#int��� w^}�� w^�@@��� w^}�� w^�@@@��� w^}�� w^�@@�����$list��� w^��� w^�@�����!t��� w^��� w^�@@��� w^��� w^�@@@��� w^��� w^�@@@@��� w^d�� w^�@@�Р.With_backtrace��� x���� x��@������!t��� x���� x��@@��� x���� x��@@�����&string��� x���� x��@@��� x���� x��@@@@��� x���� x��@���)ocaml.doc搠�����	& The second argument is the backtrace @��� x���� x��@@@��� x���� x��@@@@A@���)ocaml.doc��������	x The internal representation.  It is exposed so that we can write efficient
        serializers outside of this module. @��� m���� n�@@@��� m���� n�@@@��� o�� y��@@��� o�� y��@��������������������@@@@���Р)sexp_of_t���@������@�@����������@�@�@@@**@'@'@'���Р'of_info��+ {	�, {@��@����$info��5 {�6 {@@��8 {�9 {@@����!t��@ {�A {@@��C {�D {@@��F {�G {@@@@��I {�J {@��L {�M {@���Р'to_info��U |%�V |,@��@����!t��_ |/�` |0@@��b |/�c |0@@����$info��j |4�k |8@@��m |4�n |8@@��p |/�q |8@@@@��s |!�t |8@��v |!�w |8@@��y j]v�z }9>@@��    �$info��� }9I�� }9M@@@@A�����!t��� }9Q�� }9R@@��� }9Q�� }9R@@@��� }9D�� }9R@@��� j]v�� }9R@@@��� j]_�� }9R@��� j]_�� }9R@@���a���� ~SV@@@���a���� ~SV@���a���� ~SV@@