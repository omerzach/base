Caml1999N018����         	   =ordered_collection_common.mli����  �  h  
�  	Ϡ�����&Import��=ordered_collection_common.mliA@F�A@L@@��A@@�A@L@@��A@@�A@L@���Р)normalize��F � ��F � �@���*length_fun��@��!a��F � ��F � �@@����#int��$F � ��%F � �@@��'F � ��(F � �@@��*F � ��+F � �@@��@��!a��2F ��3F �@@��@����#int��<F �
�=F �@@��?F �
�@F �@@����#int��GF ��HF �@@��JF ��KF �@@��MF �
�NF �@@��PF ��QF �@@��SF � ��TF �@@@���)ocaml.doc��&_none_A@ �A�������	� [normalize length_fun thing_with_length i] is just [i], unless
    [i] is negative, in which case it's [length_fun thing_with_length + i].
    This is used by various python-style slice functions. @��eCNN�fE � �@@@��hCNN�iE � �@@@��kF � ��lF �@��nF � ��oF �@���Р%slice��wP���xP��@���*length_fun��@��!a���Q����Q��@@����#int���Q����Q��@@���Q����Q��@@���Q����Q��@@���'sub_fun��@��!a���R����R��@@���#pos����#int���R����R��@@���R����R��@@���#len����#int���R����R��@@���R����R��@@��!a���R����R��@@���R����R��@@���R����R��@@���R����R��@@��@��!a���S����S�@@��@����#int���T��T
@@���T��T
@@��@����#int���U��U@@���U��U@@��!a���V��V@@���U��V@@���T��V@@���S����V@@���R����V@@��Q���V@@@@��P���V@��P���V@�����*ocaml.text��������
  � [get_pos_len], [get_pos_len_exn], and [validate_pos_len_exn] are intended to be used
    by functions that take a sequence (array, string, bigstring, ...) and an optional
    [pos] and [len] specifying a subrange of the sequence.  Such functions should call
    [get_pos_len] with the length of the sequence and the optional [pos] and [len], and it
    will return the [pos] and [len] specifying the range, where the default [pos] is zero
    and the default [len] is to go to the end of the sequence.

    It should be the case that:

    {[
      pos >= 0 && len >= 0 && pos + len <= length
    ]}

    Note that this allows [pos = length] and [len = 0], i.e. an empty subrange
    at the end of the sequence.

    [get_pos_len] returns [(pos', len')] specifying a subrange where:

    {v
      pos' = match pos with None -> 0 | Some i -> i
      len' = match len with None -> length - pos | Some i -> i
    v}
 @��X�n��@@@��X�n��@@��X�n��@���Р+get_pos_len��'s���(s��@���#pos����#int��3s���4s��@@��6s���7s��@@���#len����#int��Bs���Cs��@@��Es���Fs��@@���&length����#int��Qs���Rs��@@��Ts���Us��@@�����&Result!t��^s���_s��@��������#int��js���ks��@@��ms���ns��@@�����#int��vs���ws��@@��ys���zs��@@@��|s���}s��@@�����&string���s����s��@@���s����s��@@@���s����s��@@���s����s��@@���s����s��@@���s����s��@@@@���s����s��@���s����s��@���Р/get_pos_len_exn���t����t��@���#pos����#int���t���t�@@���t���t�@@���#len����#int���t���t�@@���t���t�@@���&length����#int���t���t�!@@���t���t�!@@�������#int���t�%��t�(@@���t�%��t�(@@�����#int���t�+��t�.@@���t�+��t�.@@@���t�%��t�.@@���t���t�.@@���t���t�.@@���t����t�.@@@@���t����t�.@���t����t�.@���Р1check_pos_len_exn��x���x��@���#pos����#int��x���x��@@��x���x��@@���#len����#int�� x���!x��@@��#x���$x��@@���&length����#int��/x���0x��@@��2x���3x��@@����$unit��:x���;x��@@��=x���>x��@@��@x���Ax��@@��Cx���Dx��@@��Fx���Gx��@@@���)ocaml.doc󐠠����	h [check_pos_len_exn ~pos ~len ~length] raises unless
    [pos >= 0 && len >= 0 && pos + len <= length]. @��Uv00�Vwh�@@@��Xv00�Ywh�@@@��[x���\x��@��^x���_x��@@