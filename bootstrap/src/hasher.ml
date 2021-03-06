Caml1999M019����   
         )hasher.ml����    S    ������&Import��)hasher.mlA@F�A@L@@��A@@�A@L@@��A@@�A@L@�����*ocaml.text��&_none_A@ �A�������	� Signatures required of types which can be used in [@@deriving hash].

    For a more in-depth discussion, see documentation in ppx/ppx_hash/README.md and
    ppx/ppx_hash/doc/design.notes.
@��CNN�G � �@@@��CNN�G � �@@��!CNN�"G � �@�����!S��*I � ��+I � �@������A�    �!t��7L�8L@@@@A@���)ocaml.doc.�������; The type that is hashed.  @��FK � ��GK �
@@@��IK � ��JK �
@@@��LL�ML@@��OL�PL@���Р+hash_fold_t��Xr���Yr�@��@�����$Hash%state��dr��er�@@��gr��hr�@@��@����!t��qr��rr�@@��tr��ur�@@�����$Hash%state��~r��r�$@@���r���r�$@@���r���r�$@@���r���r�$@@@���)ocaml.doc~�������
  � [hash_fold_t state x] mixes the content of [x] into the [state].

      By default, all our [hash_fold_t] functions (derived or not) should satisfy the
      following properties.

      1. [hash_fold_t state x] should mix all the information present in [x] in the state.
      That is, by default, [hash_fold_t] will traverse the full term [x] (this is a
      significant change for Hashtbl.hash which by default stops traversing the term after
      after considering a small number of "significant values"). [hash_fold_t] must not
      discard the [state].

      2. [hash_fold_t] must be compatible with the associated [compare] function: that is,
      for all [x] [y] and [s], [compare x y = 0] must imply [hash_fold_t s x = hash_fold_t
      s y].

      3. To avoid avoid systematic collisions, [hash_fold_t] should expand to different
      sequences of built-in mixing functions for different values of [x]. No such sequence
      is allowed to be a prefix of another.

      A common mistake is to implement [hash_fold_t] of a collection by just folding all
      the elements. This makes the folding sequence of [a] be a prefix of [a @ b], thereby
      violating the requirement. This creates large families of collisions: all of the
      following collections would hash the same:

      [[]; [1;2;3]]
      [[1]; [2;3]]
      [[1; 2]; [3]]
      [[1; 2; 3]; []]
      [[1]; [2]; []; [3];]
      ...

      A good way to avoid this is to mix in the size of the collection to the beginning
      ([fold ~init:(hash_fold_int state length) ~f:hash_fold_elem]). The default in our
      libraries is to mix the length of the structure before folding. To prevent the
      afforementioned collisions, one should respect this ordering.
  @���N��q��@@@���N��q��@@@���r����r�$@���r����r�$@@���I � ���s%(@@@���I � ���s%(@���I � ���s%(@�����"S1���u*6��u*8@������A�    �!t���v?I��v?J@����!a���v?F��v?H@@B@@@A@@���v?A��v?J@@���v?A��v?J@���Р+hash_fold_t���wKQ��wK\@��@��@�����$Hash%state���wK`��wKj@@���wK`��wKj@@��@��!a���wKn��wKp@@�����$Hash%state���wKt��wK~@@���wKt��wK~@@���wKn��wK~@@��wK`�wK~@@��@�����$Hash%state��wK��wK�@@��wK��wK�@@��@����!t��wK��wK�@���!a��!wK��"wK�@@@��$wK��%wK�@@�����$Hash%state��.wK��/wK�@@��1wK��2wK�@@��4wK��5wK�@@��7wK��8wK�@@��:wK_�;wK�@@@@��=wKM�>wK�@��@wKM�AwK�@@��Cu*;�Dx��@@@��Fu**�Gx��@��Iu**�Jx��@@