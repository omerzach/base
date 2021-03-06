Caml1999N018����            /applicative.mli����  �  >  �  X������&Import��/applicative.mliA@F�A@L@@��A@@�A@L@@��A@@�A@L@����������0Applicative_intf��CNe�CNu@��CNe�CNu@@��CNV�CNu@@��CNN�CNu@@��!CNN�"CNu@�����$Make��*Ew~�+Ew B@���!X��1Ew E�2Ew F@�����%Basic��:Ew I�;Ew N@��=Ew I�>Ew N@@������!S��GEw S�HEw T@��JEw S�KEw T@@��    �!t��REw i�SEw j@����!a��ZEw a�[Ew c@@B@@@A������!X!t��eEw w�fEw z@���!a��lEw o�mEw q@@@��oEw o�pEw z@@@��rEw [�sEw z@@��uEw S�vEw z@@��xEw D�yEw z@@@��{Eww�|Ew z@��~Eww�Ew z@�����%Make2���F { ���F { �@���!X���F { ���F { �@�����&Basic2���F { ���F { �@���F { ���F { �@@������"S2���F { ���F { �@���F { ���F { �@@��    �!t���F { ���F { �@����!a���F { ���F { �@@B����!e���F { ���F { �@@B@@@A������!X!t���F { ���F { �@���!a���F { ���F { �@@���!e���F { ���F { �@@@���F { ���F { �@@@���F { ���F { �@@���F { ���F { �@@���F { ���F { �@@@���F { {��F { �@���F { {��F { �@�����)Make_args���H � ���H � �@���!X���H � ���H � �@�����!S��H � ��H � �@��H � ��H � �@@������$Args��H � ��H � �@��H � ��H � �@@��    �#arg��H � ��H � �@����!a��#H � ��$H � �@@B@@@A������!X!t��.H ��/H �	@���!a��5H � ��6H � @@@��8H � ��9H �	@@@��;H � ��<H �	@@��>H � ��?H �	@@��AH � ��BH �	@@@��DH � ��EH �	@��GH � ��HH �	@�����*Make_args2��PI
�QI
@���!X��WI
�XI
@�����"S2��`I
!�aI
#@��cI
!�dI
#@@������%Args2��mI
'�nI
,@��pI
'�qI
,@@��    �#arg��xI
@�yI
C@����!a���I
8��I
:@@B����!e���I
<��I
>@@B@@@A������!X!t���I
P��I
S@���!a���I
H��I
J@@���!e���I
L��I
N@@@���I
G��I
S@@@���I
2��I
S@@���I
'��I
S@@���I
��I
S@@@���I

��I
S@���I

��I
S@�����*ocaml.text��&_none_A@ �A�������	� The following functors give a sense of what Applicatives one can define.

    Of these, [Of_monad] is likely the most useful.  The others are mostly didactic. @���KUU��M��@@@���KUU��M��@@���KUU��M��@�����(Of_monad���X����X��@���!M���X����X��@������%Monad!S���X����X��@���X����X��@@������!S���X����X��@���X����X��@@��    �!t�� X���X��@����!a��X���	X��@@B@@@A������!M!t��X���X��@���!a��X���X��@@@��X���X��@@@�� X���!X��@@��#X���$X��@@��&X���'X��@@���)ocaml.docq�������	� Every monad is Applicative via:

    {[
      let apply mf mx =
        mf >>= fun f ->
        mx >>| fun x ->
        f x
    ]}
@��5O���6W��@@@��8O���9W��@@@��;X���<X��@��>X���?X��@�����'Compose��GY���HY��@���!F��NY���OY��@�����!S��WY���XY��@��ZY���[Y��@@���!G��aY���bY��@�����!S��jY���kY��@��mY���nY��@@������!S��wY���xY��@��zY���{Y��@@����!t���Y����Y��@    ����Y����Y��@����!a���Y����Y��@@B@@@A������!G!t���Y� ��Y�@������!F!t���Y����Y��@���!a���Y����Y��@@@���Y����Y��@@@���Y����Y�@@@���Y����Y�@@���Y����Y�@@���Y����Y�@@���Y����Y�@@@���Y����Y�@���Y����Y�@�����$Pair���Z��Z@���!F���Z��Z@�����!S���Z��Z@���Z��Z@@���!G���Z��Z@�����!S���Z!��Z"@���Z!��Z"@@������!S���Z&��Z'@�� Z&�Z'@@����!t��Z5�	Z6@    ���Z5�Z6@����!a��Z2�Z4@@B@@@A���������!F!t��#Z=�$Z@@���!a��*Z:�+Z<@@@��-Z:�.Z@@@������!G!t��8ZF�9ZI@���!a��?ZC�@ZE@@@��BZC�CZI@@@��EZ:�FZI@@@��HZ-�IZI@@��KZ&�LZI@@��NZ�OZI@@��QZ�RZI@@@��TZ�UZI@��WZ�XZI@�����%Const��`b���ab��@���&Monoid��gb���hb��@������A�    �!t��tc���uc��@@@@A@@��wc���xc��@@��zc���{c��@���Р$zero���d����d��@����!t���d����d��@@���d����d��@@@@���d����d��@���d����d��@���Р$plus���e����e��@��@����!t���e����e��@@���e����e��@@��@����!t���e����e��@@���e����e��@@����!t���e����e��@@���e����e��@@���e����e��@@���e����e��@@@���)ocaml.doc�������	Q Laws: [plus] is associative and [zero] is both a left and right unit for [plus] @���f����f�H@@@���f����f�H@@@���e����e��@���e����e��@@���b����gIN@@������!S���hPT��hPU@���hPT��hPU@@����!t���hPc��hPd@    ����hPc��hPd@����!a��hP`�hPb@@B@@@A������&Monoid!t��hPg�hPo@@��hPg�hPo@@@��hP[�hPo@@��hPT�hPo@@��b���hPo@@���)ocaml.docg�������	4 Every monoid gives rise to a constant Applicative. @��+abb�,ab�@@@��.abb�/ab�@@@��1b���2hPo@��4b���5hPo@@