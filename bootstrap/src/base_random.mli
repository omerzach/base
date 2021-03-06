Caml1999N018����            /base_random.mli����  -u  $  �  �����*ocaml.text��&_none_A@ �A�������
  � This is a slightly modified version of the OCaml standard library's random.mli.  We
    want Core's [Random] module to be different from OCaml's standard one:

    - We expose [Random.State.default], so that user code can easily share the default
      random state if it wants.

    - We disallow [Random.get_state], because it misleadingly makes a copy of random
      state.  And it is what people naturally, albeit incorrectly, grab for when they want
      to use shared random state.

    The fact that we construct our own default random state means that code using
    Core.Std.Random and code using OCaml's Random will not share the default state. @��/base_random.mliA@@�LA�@@@��A@@�LA�@@��A@@�LA�@������&Import��]�]%@@��]�]%@@��]�]%@�����*ocaml.text+�������	) Pseudo-random number generators (PRNG). @��(_''�)_'U@@@��+_''�,_'U@@��._''�/_'U@�����*ocaml.textB�������5 {6 Basic functions} @��?aWW�@aWq@@@��BaWW�CaWq@@��EaWW�FaWq@�����*ocaml.textY�������	H Note that all of these "basic" functions mutate a global random state. @��Vcss�Wcs�@@@��Ycss�Zcs�@@��\css�]cs�@���Р$init��egDH�fgDL@��@����#int��ogDO�pgDR@@��rgDO�sgDR@@����$unit��zgDV�{gDZ@@��}gDV�~gDZ@@���gDO��gDZ@@@���)ocaml.doc��������	| Initialize the generator, using the argument as a seed.  The same seed will always
    yield the same sequence of numbers. @���e����fC@@@���e����fC@@@���gDD��gDZ@���gDD��gDZ@���Р)full_init���j����j��@��@����%array���j����j��@�����#int���j����j��@@���j����j��@@@���j����j��@@����$unit���j����j��@@���j����j��@@���j����j��@@@���)ocaml.docڐ������	5 Same as {!Random.init} but takes more data as seed. @���i\\��i\�@@@���i\\��i\�@@@���j����j��@���j����j��@���Р)self_init���q	U	Y��q	U	b@���.allow_in_tests����$bool���q	U	u��q	U	y@@���q	U	u��q	U	y@@��@����$unit��q	U	}�q	U	�@@��q	U	}�q	U	�@@����$unit��q	U	��q	U	�@@��q	U	��q	U	�@@��q	U	}�q	U	�@@��q	U	e�q	U	�@@@���)ocaml.doc(�������
  � Initialize the generator with a more-or-less random seed chosen in a system-dependent
    way.  By default, [self_init] is disallowed in inline tests, as it's often used for no
    good reason and it just creates non deterministic failures for everyone.  Passing
    [~allow_in_tests:true] removes this restriction in case you legitimately want
    non-deterministic values, like in [Filename.temp_dir]. @��%l���&p		T@@@��(l���)p		T@@@��+q	U	U�,q	U	�@��.q	U	U�/q	U	�@���Р$bits��7v

�8v

@��@����$unit��Av

"�Bv

&@@��Dv

"�Ev

&@@����#int��Lv

*�Mv

-@@��Ov

*�Pv

-@@��Rv

"�Sv

-@@@���)ocaml.docd�������	� Return 30 random bits in a nonnegative integer.  @before 3.12.0 used a different
    algorithm (affects all the following functions)
@��as	�	��bu

@@@��ds	�	��eu

@@@��gv

�hv

-@��jv

�kv

-@���Р#int��sz
�
��tz
�
�@��@����#int��}z
�
��~z
�
�@@���z
�
���z
�
�@@����#int���z
�
���z
�
�@@���z
�
���z
�
�@@���z
�
���z
�
�@@@���)ocaml.doc��������	� [Random.int bound] returns a random integer between 0 (inclusive) and [bound]
    (exclusive).  [bound] must be greater than 0. @���x
/
/��y
�
�@@@���x
/
/��y
�
�@@@���z
�
���z
�
�@���z
�
���z
�
�@���Р%int32���~UY��~U^@��@�����%Int32!t���~Ua��~Uh@@���~Ua��~Uh@@�����%Int32!t���~Ul��~Us@@���~Ul��~Us@@���~Ua��~Us@@@���)ocaml.doc��������	� [Random.int32 bound] returns a random integer between 0 (inclusive) and [bound]
    (exclusive).  [bound] must be greater than 0. @���|
�
���} T@@@���|
�
���} T@@@���~UU��~Us@���~UU��~Us@���Р)nativeint��� B�� B@��@�����)Nativeint!t��� B�� B@@��� B�� B@@�����)Nativeint!t�� B!�	 B,@@�� B!� B,@@�� B� B,@@@���)ocaml.doc �������	� [Random.nativeint bound] returns a random integer between 0 (inclusive) and [bound]
    (exclusive).  [bound] must be greater than 0. @�� @uu� A�@@@��  @uu�! A�@@@��# B�$ B,@��& B�' B,@���Р%int64��/ F���0 F��@��@�����%Int64!t��; F���< F��@@��> F���? F��@@�����%Int64!t��H F���I F��@@��K F���L F��@@��N F���O F��@@@���)ocaml.doc`�������	� [Random.int64 bound] returns a random integer between 0 (inclusive) and [bound]
    (exclusive).  [bound] must be greater than 0. @��] D..�^ E��@@@��` D..�a E��@@@��c F���d F��@��f F���g F��@���Р%float��o K���p K��@��@����%float��y K���z K��@@��| K���} K��@@����%float��� K���� K��@@��� K���� K��@@��� K���� K��@@@���)ocaml.doc��������	� [Random.float bound] returns a random floating-point number between 0 (inclusive) and
    [bound] (exclusive).  If [bound] is negative, the result is negative or zero.  If
    [bound] is 0, the result is 0. @��� H���� J��@@@��� H���� J��@@@��� K���� K��@��� K���� K��@���Р$bool��� N�� N@��@����$unit��� N!�� N%@@��� N!�� N%@@����$bool��� N)�� N-@@��� N)�� N-@@��� N!�� N-@@@���)ocaml.docؐ������	G [Random.bool ()] returns [true] or [false] with probability 0.5 each. @��� M���� M�@@@��� M���� M�@@@��� N�� N-@��� N�� N-@�����*ocaml.text򐠠����8 {6 Advanced functions} @��� P//�� P/L@@@��� P//�� P/L@@��� P//�� P/L@�����%State��� X���� X��@�����A�    �!t��
 Y��� Y��@@@@A@@�� Y��� Y��@@�� Y��� Y��@���Р'default�� [��� [��@����!t��! [���" [��@@��$ [���% [��@@@@��' [���( [��@��* [���+ [��@���Р$make��3 ^39�4 ^3=@��@����%array��= ^3D�> ^3I@�����#int��F ^3@�G ^3C@@��I ^3@�J ^3C@@@��L ^3@�M ^3I@@����!t��T ^3M�U ^3N@@��W ^3M�X ^3N@@��Z ^3@�[ ^3N@@@���)ocaml.docl�������	; Create a new state and initialize it with the given seed. @��i ]���j ]�2@@@��l ]���m ]�2@@@��o ^35�p ^3N@��r ^35�s ^3N@���Р.make_self_init��{ a���| a��@���.allow_in_tests����$bool��� a���� a��@@��� a���� a��@@��@����$unit��� a���� a��@@��� a���� a��@@����!t��� a���� a��@@��� a���� a��@@��� a���� a��@@��� a���� a��@@@���)ocaml.doc��������	P Create a new state and initialize it with a system-dependent low-entropy seed. @��� `PR�� `P�@@@��� `PR�� `P�@@@��� a���� a��@��� a���� a��@���Р$copy��� c���� c��@��@����!t��� c���� c��@@��� c���� c��@@����!t��� c���� c��@@��� c���� c��@@��� c���� c��@@@@��� c���� c��@��� c���� c��@���Р$bits��� g���� g��@��@����!t��� g���� g��@@��  g��� g��@@����#int�� g���	 g��@@�� g��� g��@@�� g��� g��@@@���)ocaml.doc �������	� These functions are the same as the basic functions, except that they use (and
      update) the given PRNG state instead of the default one.  @�� e��� fL�@@@��  e���! fL�@@@��# g���$ g��@��& g���' g��@���Р#int��/ h���0 h��@��@����!t��9 h���: h��@@��< h���= h��@@��@����#int��F h���G h��@@��I h���J h��@@����#int��Q h���R h��@@��T h���U h��@@��W h���X h��@@��Z h���[ h��@@@@��] h���^ h��@��` h���a h��@���Р%int32��i i���j i��@��@����!t��s i���t i��@@��v i���w i��@@��@�����%Int32!t��� i���� i��@@��� i���� i��@@�����%Int32!t��� i���� i��@@��� i���� i��@@��� i���� i��@@��� i���� i��@@@@��� i���� i��@��� i���� i��@���Р)nativeint��� j���� j��@��@����!t��� j���� j��@@��� j���� j��@@��@�����)Nativeint!t��� j���� j�	@@��� j���� j�	@@�����)Nativeint!t��� j��� j�@@��� j��� j�@@��� j���� j�@@��� j���� j�@@@@��� j���� j�@��� j���� j�@���Р%int64��� k�� k$@��@����!t��� k'�� k(@@��� k'�� k(@@��@�����%Int64!t��� k,�� k3@@�� k,� k3@@�����%Int64!t�� k7� k>@@�� k7� k>@@�� k,� k>@@�� k'� k>@@@@�� k� k>@�� k� k>@���Р%float��# l?E�$ l?J@��@����!t��- l?M�. l?N@@��0 l?M�1 l?N@@��@����%float��: l?R�; l?W@@��= l?R�> l?W@@����%float��E l?[�F l?`@@��H l?[�I l?`@@��K l?R�L l?`@@��N l?M�O l?`@@@@��Q l?A�R l?`@��T l?A�U l?`@���Р$bool��] mag�^ mak@��@����!t��g man�h mao@@��j man�k mao@@����$bool��r mas�s maw@@��u mas�v maw@@��x man�y maw@@@@��{ mac�| maw@��~ mac� maw@@��� X���� nx{@@���)ocaml.doc��������
  l The functions from module [State] manipulate the current state of the random generator
    explicitly.  This allows using one or several deterministic PRNGs, even in a
    multi-threaded program, without interference from other parts of the program.

    Obtaining multiple generators with good independence properties is nontrivial; see
    [Splittable_random]. @��� RNN�� W��@@@��� RNN�� W��@@@��� X���� nx{@��� X���� nx{@���Р)get_state��� ty}�� ty�@��@����$unit��� ty��� ty�@@��� ty��� ty�@@����	#Consider_using_Random_State_default@A@@@@��� ty��� ty�@@��� ty��� ty�@@@���)ocaml.doc̐������	� OCaml's [Random.get_state] makes a copy of the default state, which is almost
    certainly not what you want.  [State.default], which is the actual default state, is
    probably what you want. @��� q���� sZx@@@��� q���� sZx@@@��� tyy�� ty�@��� tyy�� ty�@���Р)set_state��� w��� w�@��@�����%State!t��� w��� w�@@��� w��� w�@@����$unit��� w��� w�@@��� w��� w�@@��� w��� w�@@@���)ocaml.doc
�������	= Set the state of the generator used by the basic functions. @�� v��� v��@@@��
 v��� v��@@@�� w��� w�@�� w��� w�@@