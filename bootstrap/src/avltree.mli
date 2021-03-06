Caml1999N018����            +avltree.mli����  1�  t  �  ������*ocaml.text��&_none_A@ �A�������
  	� A low-level, mutable AVL tree.

    It is not intended to be used directly by casual users. It is used for implementing
    other data structures. The interface is somewhat ugly, and it's that way for a
    reason. The goal of this module is minimum memory overhead, and maximum performance.

 ***************** Points of Ugliness *****************

    * compare is passed in to every function where it is used. If you pass a different
    compare to functions on the same tree, then all bets are off as far as what it does,
    and it's all your fault. Why? Because otherwise we'd need a top level record to store
    compare, and when building a hash table, or other structure, that little t is a block
    that increases memory overhead. However, if an empty tree is just a constructor
    'Empty', then it's just a number, and uses no extra memory beyond the array bucket
    that holds it. That's the first secret of how Base_hashtbl's memory overhead isn't
    higher than INRIA's, even though it uses a tree instead of a list for buckets.

    * But you said it's mutable, why do all the 'mutators' return t. Answer, it is
    mutable, but the root node might change due to balancing. Since we have no top level
    record to hold the current root node (see point 1), you have to do it. If you fail to
    do it, and use an old root node, you're responsible for the (sure to be nasty)
    consequences.

    * What on earth is up with the ~removed argument to some functions. See point 1, since
    there is no top level node, it isn't possible to keep track of how many nodes are in
    the tree unless each mutator tells you whether or not it added or removed a node, vs
    replacing an existing one. If you intend to keep a count (as you must in a hash
    table), then you will need to pay attention to this flag.

    After all this, you're probably asking yourself whether all these hacks are worth
    it. Yes! They are! With them, we built a hash table that is faster than INRIA's (no
    small feat actually), with the same memory overhead, with sane add semantics (the add
    semantics they used were a performance hack), and with worst case log(N) insertion,
    lookup, and removal. I'd say that's worth it. But for those of you who will feel
    morally compelled to put in a CR about this interface. I challenge you to write a
    better interface, implement a hash table with it, and show that your table has better
    performance than Base_hashtbl.
@��+avltree.mliA@@�f	�	�@@@��A@@�f	�	�@@��A@@�f	�	�@������&Import��h	�	��h	�	�@@��h	�	��h	�	�@@��h	�	��h	�	�@���A�    �!t��!m
�
��"m
�
�@����!k��)m
�
��*m
�
�@@B����!v��1m
�
��2m
�
�@@B@@��Р%Empty��9n
�
��:n
�
�@�@@��=n
�
��>n
�
�@@�Р$Node��Do
�
��Eo
�
�@��Р$left��Lo
�
��Mo
�
�@A����!t��To
�
��Uo
�
�@���!k��[o
�
��\o
�
�@@���!v��bo
�
��co
�
�@@@��eo
�
��fo
�
�@@��ho
�
��ip
�
�@@�Р#key��op
�
��pp
�
�@@��!k��up
��vp
�@@��xp
�
��yq@@�Р%value��q��q#@A��!v���q'��q)@@���q��r*7@@�Р&height���r*@��r*F@A����#int���r*I��r*L@@���r*I��r*L@@���r*8��sMZ@@�Р%right���sMc��sMh@A����!t���sMu��sMv@���!k���sMm��sMo@@���!v���sMq��sMs@@@���sMl��sMv@@���sM[��sMv@@@@���o
�
���tw�@@�Р$Leaf���u����u��@��Р#key���u����u��@@��!k���u����u��@@���u����v��@@�Р%value���v����v��@A��!v���v����v��@@���v����v��@@@@���u����w��@@@@@���)ocaml.doc �������	� We expose [t] to allow an optimization in Hashtbl that makes iter and fold more than
    twice as fast.  We keep the type private to reduce opportunities for external code to
    violate avltree invariants. @���j	�	���l
u
�@@@�� j	�	��l
u
�@@@��m
�
��w��@@��m
�
��w��@���Р%empty��y���y��@����!t��y���y��@���!k��y���y��@@���!v��%y���&y��@@@��(y���)y��@@@@��+y���,y��@��.y���/y��@���Р)invariant��7|37�8|3@@��@����!t��A|3L�B|3M@���!k��H|3D�I|3F@@���!v��O|3H�P|3J@@@��R|3C�S|3M@@���'compare��@��!k��^|3Z�_|3\@@��@��!k��f|3`�g|3b@@����#int��n|3f�o|3i@@��q|3f�r|3i@@��t|3`�u|3i@@��w|3Z�x|3i@@����$unit��|3n��|3r@@���|3n��|3r@@���|3Q��|3r@@���|3C��|3r@@@���)ocaml.doc��������	= check invariants, raise an exception if any invariants fail @���{����{�2@@@���{����{�2@@@���|33��|3r@���|33��|3r@���Р#add��� F�� F@��@����!t��� G#�� G$@���!k��� G�� G@@���!v��� G�� G!@@@��� G�� G$@@���'replace����$bool��� H%2�� H%6@@��� H%2�� H%6@@���'compare��@��!k��� I7E�� I7G@@��@��!k��� I7K�� I7M@@����#int��� I7Q�� I7T@@��� I7Q�� I7T@@��� I7K�� I7T@@��� I7E�� I7T@@���%added����#ref�� JVf� JVi@�����$bool�� JVa� JVe@@�� JVa� JVe@@@�� JVa� JVi@@���#key��!k�� Kjs� Kju@@���$data��!v��' Lv��( Lv�@@����!t��/ M���0 M��@���!k��6 M���7 M��@@���!v��= M���> M��@@@��@ M���A M��@@��C Lv{�D M��@@��F Kjo�G M��@@��I JV[�J M��@@��L I7<�M M��@@��O H%*�P M��@@��R G�S M��@@@���)ocaml.docd�������
  � adds the specified key and data to the tree destructively (previous t's are no longer
    valid) using the specified comparison function. O(log(N)) time, O(1) space. The
    returned t is the new root node of the tree, and should be used on all further calls
    to any other function in this module. The bool ref, added, will be set to true if a
    new node is added to the tree, or false if an existing node is replaced (in the case
    that the key already exists). If [replace] (default true) is true then add will
    overwrite any existing mapping for [key]. If [replace] is false, and there is an
    existing mapping for key then add has no effect. @��a~tt�b E�@@@��d~tt�e E�@@@��g F�h M��@��j F�k M��@���Р%first��s P���t P��@��@����!t��} P���~ P��@���!k��� P���� P��@@���!v��� P���� P��@@@��� P���� P��@@����&option��� P��� P�
@������!k��� P���� P��@@���!v��� P� �� P�@@@��� P���� P�@@@��� P���� P�
@@��� P���� P�
@@@���)ocaml.doc������	F Returns the first (leftmost) or last (rightmost) element in the tree @��� O���� O��@@@��� O���� O��@@@��� P���� P�
@��� P���� P�
@���Р$last��� Q�� Q@��@����!t��� Q �� Q!@���!k��� Q�� Q@@���!v��� Q�� Q@@@��� Q�� Q!@@����&option��� Q/�� Q5@������!k��� Q&�� Q(@@���!v�� Q+� Q-@@@�� Q&�	 Q-@@@�� Q%� Q5@@�� Q� Q5@@@@�� Q� Q5@�� Q� Q5@���Р$find�� U��� U��@��@����!t��' U���( U��@���!k��. U���/ U��@@���!v��5 U���6 U��@@@��8 U���9 U��@@���'compare��@��!k��D U���E U��@@��@��!k��L U���M U��@@����#int��T U���U U��@@��W U���X U��@@��Z U���[ U��@@��] U���^ U��@@��@��!k��e U���f U��@@����&option��m U���n U��@���!v��t U���u U��@@@��w U���x U��@@��z U���{ U��@@��} U���~ U��@@��� U���� U��@@@���)ocaml.doc��������	m if the specified key exists in the tree, return the corresponding value.
    O(log(N)) time and O(1) space. @��� S77�� T��@@@��� S77�� T��@@@��� U���� U��@��� U���� U��@���Р-find_and_call��� ^���� ^��@��@����!t��� _���� _��@���!k��� _���� _��@@���!v��� _���� _��@@@��� _���� _��@@���'compare��@��!k��� `���� `��@@��@��!k��� `���� `��@@����#int��� `��� `�@@��� `��� `�@@��� `���� `�@@��� `���� `�@@��@��!k��� a�� a@@���(if_found��@��!v��� b�� b!@@��!a��� b%�� b'@@��� b�� b'@@���,if_not_found��@��!k��
 c)<� c)>@@��!a�� c)B� c)D@@�� c)<� c)D@@��!a�� dFK� dFM@@�� c).� dFM@@�� b�  dFM@@��" a�# dFM@@��% `���& dFM@@��( _���) dFM@@@���)ocaml.doc:�������	� [find_and_call t ~compare k ~if_found ~if_not_found]

    is equivalent to:

    [match find t ~compare k with Some v -> if_found v | None -> if_not_found k]

    except that it doesn't allocate the option. @��7 W���8 ]��@@@��: W���; ]��@@@��= ^���> dFM@��@ ^���A dFM@���Р#mem��I g���J g��@��@����!t��S g���T g��@���!k��Z g���[ g��@@���!v��a g���b g��@@@��d g���e g��@@���'compare��@��!k��p g���q g��@@��@��!k��x g���y g��@@����#int��� g���� g��@@��� g���� g��@@��� g���� g��@@��� g���� g��@@��@��!k��� g���� g��@@����$bool��� g���� g��@@��� g���� g��@@��� g���� g��@@��� g���� g��@@��� g���� g��@@@���)ocaml.doc��������	D return true if key is present in the tree, otherwise return false. @��� fOO�� fO�@@@��� fOO�� fO�@@@��� g���� g��@��� g���� g��@���Р&remove��� l���� l��@��@����!t��� m���� m��@���!k��� m���� m��@@���!v��� m���� m��@@@��� m���� m��@@���'removed����#ref��� n���� n�@�����$bool��� n���� n��@@��� n���� n��@@@��� n���� n�@@���'compare��@��!k�� o�	 o@@��@��!k�� o� o@@����#int�� o� o@@�� o� o@@�� o� o@@��! o�" o@@��@��!k��) p!&�* p!(@@����!t��1 q)7�2 q)8@���!k��8 q)/�9 q)1@@���!v��? q)3�@ q)5@@@��B q).�C q)8@@��E p!&�F q)8@@��H o�I q)8@@��K n���L q)8@@��N m���O q)8@@@���)ocaml.doc`�������	� remove key destructively from the tree if it exists, return the new root node.
    Previous root nodes are not usable anymore, do so at your peril. the removed ref will
    be set to true if a node was actually removed, or false otherwise. @��] i���^ k��@@@��` i���a k��@@@��c l���d q)8@��f l���g q)8@���Р$fold��o tTX�p tT\@��@����!t��y tTh�z tTi@���!k��� tT`�� tTb@@���!v��� tTd�� tTf@@@��� tT_�� tTi@@���$init��!a��� tTr�� tTt@@���!f���#key��!k��� tT�� tT�@@���$data��!v��� tT��� tT�@@��@��!a��� tT��� tT�@@��!a��� tT��� tT�@@��� tT��� tT�@@��� tT��� tT�@@��� tT{�� tT�@@��!a��� tT��� tT�@@��� tTx�� tT�@@��� tTm�� tT�@@��� tT_�� tT�@@@���)ocaml.doc䐠�����4 fold over the tree @��� s::�� s:S@@@��� s::�� s:S@@@��� tTT�� tT�@��� tTT�� tT�@���Р$iter��� w���� w��@��@����!t��� w���� w��@���!k�� w��� w��@@���!v�� w��� w��@@@�� w��� w��@@���!f���#key��!k�� w��� w��@@���$data��!v��& w���' w��@@����$unit��. w���/ w��@@��1 w���2 w��@@��4 w���5 w��@@��7 w���8 w��@@����$unit��? w���@ w��@@��B w���C w��@@��E w���F w��@@��H w���I w��@@@���)ocaml.docZ�������7 iterate over the tree @��W v���X v��@@@��Z v���[ v��@@@��] w���^ w��@��` w���a w��@@