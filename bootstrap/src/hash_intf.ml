Caml1999M019����            ,hash_intf.ml����  5t  �   �  Р����*ocaml.text��&_none_A@ �A�������
  � [Hash_intf.S] is the interface which a hash-function must support

    The functions of [Hash_intf.S] are only allowed to be used in specific sequence:

        alloc, reset ?seed, fold_..*, get_hash_value,
               reset ?seed, fold_..*, get_hash_value, ...

    (The optional [seed]s passed to each reset may differ.)

    The chain of applications from [reset] to [get_hash_value] must be done in a
    single-threaded manner (you can't use fold_* on a state that's been used before)

    More precisely, [alloc ()] creates a new family of states. All functions that take [t]
    and produce [t] return a new state from the same family.

    At any point in time, at most one state in the family is "valid". The other states
    are "invalid".

    The state returned by [alloc] is invalid.
    The state returned by [reset] is valid (all of the other states become invalid).
    The [fold_*] family of functions requres a valid state and produces a valid state
    (thereby making the input state invalid).
    [get_hash_value] requires a valid state and makes it invalid.

    These requirements are currently formally encoded in [Check_initialized_correctly]
    module in bench/bench.ml.
@��,hash_intf.mlA@@�[��@@@��A@@�[��@@��A@@�[��@�����!S��]���]��@������Р+description��`�`"@����&string��$`%�%`+@@��'`%�(`+@@@���)ocaml.doc9�������	; Name of the hash-function, e.g. "internalhash", "siphash" @��6_���7_�@@@��9_���:_�@@@��<`�=`+@��?`�@`+@���A�    �%state��Ict{�Jct�@@@@A@���)ocaml.doc[�������	? [state] is the internal hash-state used by the hash function. @��Xb-/�Yb-s@@@��[b-/�\b-s@@@��^ctv�_ct�@@��actv�bct�@���Р(fold_int��ji���ki��@��@����%state��ti���ui��@@��wi���xi��@@��@����#int���i����i��@@���i����i��@@����%state���i����i��@@���i����i��@@���i����i��@@���i����i��@@@���)ocaml.doc��������
  4 [fold_<T> state v] incorporates a value [v] of type <T> into the hash-state,
      returning a modified hash-state. Implementations of the [fold_<T>] functions may
      mutate the [state] argument in place, and return a reference to it.
      Implementations of the fold_<T> functions should not allocate. @���e����hv�@@@���e����hv�@@@���i����i��@���i����i��@���Р*fold_int64���j����j��@��@����%state���j����j�@@���j����j�@@��@����%int64���j���j�@@���j���j�@@����%state���j���j�@@���j���j�@@���j���j�@@���j����j�@@@@���j����j�@���j����j�@���Р*fold_float���k��k(@��@����%state���k,��k1@@���k,��k1@@��@����%float��k5�k:@@��
k5�k:@@����%state��k?�kD@@��k?�kD@@��k5�kD@@��k,�kD@@@@��k�kD@��!k�"kD@���Р+fold_string��*lEK�+lEV@��@����%state��4lEY�5lE^@@��7lEY�8lE^@@��@����&string��AlEb�BlEh@@��DlEb�ElEh@@����%state��LlEl�MlEq@@��OlEl�PlEq@@��RlEb�SlEq@@��UlEY�VlEq@@@@��XlEG�YlEq@��[lEG�\lEq@���A�    �$seed��eo���fo��@@@@A@���)ocaml.docw�������	9 [seed] is the type used to seed the initial hash-state. @��tnsu�uns�@@@��wnsu�xns�@@@��zo���{o��@@��}o���~o��@���Р%alloc���r��r@��@����$unit���r��r@@���r��r@@����%state���r#��r(@@���r#��r(@@���r��r(@@@���)ocaml.doc��������	D [alloc ()] returns a fresh uninitialized hash-state. May allocate. @���q����q�@@@���q����q�@@@���r��r(@���r��r(@���Р%reset���v����v��@���$seed����$seed���v����v��@@���v����v��@@��@����%state���v����v��@@���v����v��@@����%state���v����v��@@���v����v��@@���v����v��@@���v����v��@@@���)ocaml.doc�������	� [reset ?seed state] initializes/resets a hash-state with the given [seed], or else a
      default-seed. Argument [state] may be mutated. Should not allocate. @���t*,��u��@@@��t*,�u��@@@��v���v��@��v���v��@���A�    �*hash_value��y	J	Q�y	J	[@@@@A@���)ocaml.doc#�������	D [hash_value] The type of hash values, returned by [get_hash_value] @�� x�	 �!x�	I@@@��#x�	 �$x�	I@@@��&y	J	L�'y	J	[@@��)y	J	L�*y	J	[@���Р.get_hash_value��2|	�	��3|	�	�@��@����%state��<|	�	��=|	�	�@@��?|	�	��@|	�	�@@����*hash_value��G|	�	��H|	�	�@@��J|	�	��K|	�	�@@��M|	�	��N|	�	�@@@���)ocaml.doc_�������	= [get_hash_value] extracts a hash-value from the hash-state. @��\{	]	_�]{	]	�@@@��_{	]	_�`{	]	�@@@��b|	�	��c|	�	�@��e|	�	��f|	�	�@�����)For_tests��n~	�	��o~	�	�@�����Р-compare_state��y	�	��z	�	�@��@����%state���	�	���	�
@@���	�	���	�
@@��@����%state���	�
��	�
@@���	�
��	�
@@����#int���	�
��	�
@@���	�
��	�
@@���	�
��	�
@@���	�	���	�
@@@@���	�	���	�
@���	�	���	�
@���Р/state_to_string��� @

�� @

,@��@����%state��� @

/�� @

4@@��� @

/�� @

4@@����&string��� @

8�� @

>@@��� @

8�� @

>@@��� @

/�� @

>@@@@��� @

�� @

>@��� @

�� @

>@@���~	�	��� A
?
D@@@���~	�	��� A
?
D@���~	�	��� A
?
D@@���]���� B
E
H@@@���]���� B
E
H@���]���� B
E
H@�����,Builtin_intf��� D
J
V�� D
J
b@������A�    �%state��� F
j
q�� F
j
v@@@@A@@��� F
j
l�  F
j
v@@�� F
j
l� F
j
v@���A�    �&folder�� G
w
�� G
w
�@����!a�� G
w
~� G
w
�@@B@@@A���@����%state�� G
w
��  G
w
�@@��" G
w
��# G
w
�@@��@��!a��* G
w
��+ G
w
�@@����%state��2 G
w
��3 G
w
�@@��5 G
w
��6 G
w
�@@��8 G
w
��9 G
w
�@@��; G
w
��< G
w
�@@@��> G
w
y�? G
w
�@@��A G
w
y�B G
w
�@���Р3hash_fold_nativeint��J I
�
��K I
�
�@����&folder��R I
�
��S I
�
�@�����)nativeint��[ I
�
��\ I
�
�@@��^ I
�
��_ I
�
�@@@��a I
�
��b I
�
�@@@@��d I
�
��e I
�
�@��g I
�
��h I
�
�@���Р/hash_fold_int64��p J
�
��q J
�
�@����&folder��x J
��y J
�@�����%int64��� J
�
��� J
�
�@@��� J
�
��� J
�
�@@@��� J
�
��� J
�@@@@��� J
�
��� J
�@��� J
�
��� J
�@���Р/hash_fold_int32��� K�� K@����&folder��� K5�� K;@�����%int32��� K'�� K,@@��� K'�� K,@@@��� K'�� K;@@@@��� K
�� K;@��� K
�� K;@���Р.hash_fold_char��� L<B�� L<P@����&folder��� L<i�� L<o@�����$char��� L<[�� L<_@@��� L<[�� L<_@@@��� L<[�� L<o@@@@��� L<>�� L<o@��� L<>�� L<o@���Р-hash_fold_int��� Mpv�� Mp�@����&folder��� Mp��� Mp�@�����#int��� Mp��� Mp�@@��� Mp��� Mp�@@@��� Mp��� Mp�@@@@��� Mpr�� Mp�@��� Mpr�  Mp�@���Р.hash_fold_bool�� N���	 N��@����&folder�� N��� N��@�����$bool�� N��� N��@@�� N��� N��@@@�� N���  N��@@@@��" N���# N��@��% N���& N��@���Р0hash_fold_string��. O���/ O��@����&folder��6 O��7 O�@�����&string��? O���@ O��@@��B O���C O��@@@��E O���F O�@@@@��H O���I O�@��K O���L O�@���Р/hash_fold_float��T P�U P!@����&folder��\ P9�] P?@�����%float��e P+�f P0@@��h P+�i P0@@@��k P+�l P?@@@@��n P�o P?@��q P�r P?@���Р.hash_fold_unit��z Q@F�{ Q@T@����&folder��� Q@m�� Q@s@�����$unit��� Q@_�� Q@c@@��� Q@_�� Q@c@@@��� Q@_�� Q@s@@@@��� Q@B�� Q@s@��� Q@B�� Q@s@���Р0hash_fold_option��� Su{�� Su�@��@����&folder��� Su��� Su�@���!a��� Su��� Su�@@@��� Su��� Su�@@����&folder��� Su��� Su�@�����&option��� Su��� Su�@���!a��� Su��� Su�@@@��� Su��� Su�@@@��� Su��� Su�@@��� Su��� Su�@@@@��� Suw�� Su�@��� Suw�� Su�@���Р.hash_fold_list��� T���� T��@��@����&folder��� T���� T��@���!a��� T���� T��@@@��� T���� T��@@����&folder��  T��� T��@�����$list��	 T���
 T��@���!a�� T��� T��@@@�� T��� T��@@@�� T��� T��@@�� T��� T��@@@@�� T��� T��@�� T���  T��@���Р0hash_fold_lazy_t��( U���) U�@��@����&folder��2 U��3 U�@���!a��9 U��: U�@@@��< U��= U�@@����&folder��D U�(�E U�.@�����&lazy_t��M U� �N U�&@���!a��T U��U U�@@@��W U��X U�&@@@��Z U��[ U�.@@��] U��^ U�.@@@@��` U���a U�.@��c U���d U�.@�����*ocaml.textw�������
  � Hash support for [array] and [ref] is provided, but is potentially DANGEROUS, since
      it incorporates the current contents of the array/ref into the hash value.  Because
      of this we add a [_frozen] suffix to the function name.

      Hash support for [string] is also potentially DANGEROUS, but strings are mutated less
      often, so we don't append [_frozen] to it.

      Also note that we don't support [bytes].
  @��t W02�u _��@@@��w W02�x _��@@��z W02�{ _��@���Р4hash_fold_ref_frozen��� a���� a� @��@����&folder��� a��� a�@���!a��� a��� a�@@@��� a��� a�@@����&folder��� a��� a�@�����#ref��� a��� a�@���!a��� a��� a�@@@��� a��� a�@@@��� a��� a�@@��� a��� a�@@@@��� a���� a�@��� a���� a�@���Р6hash_fold_array_frozen��� b$�� b:@��@����&folder��� b@�� bF@���!a��� b=�� b?@@@��� b=�� bF@@����&folder��� bS�� bY@�����%array��� bM�� bR@���!a��� bJ�� bL@@@��� bJ�� bR@@@��� bJ�� bY@@��� b=�� bY@@@@��� b �  bY@�� b � bY@@�� D
J
e� d[^@@@�� D
J
J�	 d[^@�� D
J
J� d[^@�����$Full�� f`l� f`p@�����������!S��# hx��$ hx�@��& hx��' hx�@@��) hxz�* hx�@@��, hxz�- hx�@���A�    �&folder��6 j���7 j��@����!a��> j���? j��@@B@@@A���@����%state��I j���J j��@@��L j���M j��@@��@��!a��T j���U j��@@����%state��\ j���] j��@@��_ j���` j��@@��b j���c j��@@��e j���f j��@@@��h j���i j��@@��k j���l j��@���Р&create��t m�u m@���$seed����$seed��� m�� m@@��� m�� m@@��@����$unit��� m�� m#@@��� m�� m#@@����%state��� m'�� m,@@��� m'�� m,@@��� m�� m,@@��� m�� m,@@@���)ocaml.doc��������	L [create ?seed ()] is a convenience. Equivalent to [reset ?seed (alloc ())] @��� l���� l�@@@��� l���� l�@@@��� m�� m,@��� m�� m,@�����'Builtin��� o.7�� o.>@������,Builtin_intf��� o.A�� o.M@��� o.A�� o.M@@��    �%state��� pN\�� pNa@@@@A�����%state��� pNe�� pNj@@��� pNe�� pNj@@@��� pNW�� pNj@��    �&folder��� qk|�� qk�@����!a��� qky�� qk{@@B@@@A�����&folder��� qk��  qk�@���!a�� qk�� qk�@@@��	 qk��
 qk�@@@�� qkt� qk�@@�� o.A� qk�@@@�� o.0� qk�@�� o.0� qk�@���Р#run�� z��� z��@���$seed����$seed��* z���+ z��@@��- z���. z��@@��@����&folder��7 z���8 z��@���!a��> z���? z��@@@��A z���B z��@@��@��!a��I z���J z��@@����*hash_value��Q z���R z��@@��T z���U z��@@��W z���X z��@@��Z z���[ z��@@��] z���^ z��@@@���)ocaml.doco�������
  ' [run ?seed folder x] runs [folder] on [x] in a newly allocated
      hash-state, initialized using optional [seed] or a default-seed.

      The following identity exists: [run [%hash_fold: T]] == [[%hash: T]]

      [run] can be used if we wish to run a hash-folder with a non-default seed.
  @��l s���m y��@@@��o s���p y��@@@��r z���s z��@��u z���v z��@@��x f`s�y |��@@@��{ f``�| |��@��~ f``� |��@@