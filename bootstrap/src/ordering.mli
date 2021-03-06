Caml1999N018����            ,ordering.mli����  
u  �  �  c�����*ocaml.text��&_none_A@ �A�������
  � [Ordering] is intended to make code that matches on the result of a comparison
    more concise and easier to read.  For example, one would write:

    {[
      match Ordering.of_int (compare x y) with
      | Less -> ...
      | Equal -> ...
      | Greater -> ...
    ]}

    rather than:

    {[
      let r = compare x y in
      if r < 0 then
        ...
      else if r = 0 then
        ...
      else
        ...
    ]}
@��,ordering.mliA@@�V��@@@��A@@�V��@@��A@@�V��@������&Import��X���X��@@��X���X��@@��X���X��@���A�    �!t��!Z���"Z��@@@��Р$Less��)[���*[��@�@@��-[���.[��@@�Р%Equal��4\���5\��@�@@��8\���9\��@@�Р'Greater��?]���@]��@�@@��C]���D]��@@@A@@��FZ���G^�@@��IZ���J^�@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexpE��@������'Sexplib$Sexp!tP@P@����UT@T@T@@@//���Р)sexp_of_tZ��@����a`@`@������'Sexplib$Sexp!ti@i@i@@@DD���Р+hash_fold_to��@�����$Hash%statex@x@��@����~@~@������@�@�@�@@@^^���Р$hash���@������@�@�����*hash_value�@�@�@@@pp���Р'compare���@������@�@��@������@�@����#int�@�@�@�@@@��@�@�@����Р&of_int���hrv��hr|@��@����#int���hr��hr�@@���hr��hr�@@����!t���hr���hr�@@���hr���hr�@@���hr��hr�@@@���)ocaml.doc �������	g [of_int n] is:

    {v
      Less     if n < 0
      Equal    if n = 0
      Greater  if n > 0
    v}
@���`��goq@@@�� `�goq@@@��hrr�hr�@��hrr�hr�@���Р&to_int��uw{�uw�@��@����!t��uw��uw�@@��uw��uw�@@����#int��$uw��%uw�@@��'uw��(uw�@@��*uw��+uw�@@@���)ocaml.doc<�������	� [to_int t] is:

    {v
      Less     -> -1
      Equal    -> 0
      Greater  -> 1
    v}

    It can be useful when writing a comparison function to allow one to return
    [Ordering.t] values and transform them to [int]s later.
@��9j���:ttv@@@��<j���=ttv@@@��?uww�@uw�@��Buww�Cuw�@�����&Export��Kw���Lw��@�����A�    �)_ordering��Wx���Xx��@@@��Р$Less��_y���`y��@�@@��cy���dy��@@�Р%Equal��jz���kz��@�@@��nz���oz��@@�Р'Greater��u{���v{��@�@@��y{���z{��@@@A�����!t���x����x��@@���x����x��@@@���x����{��@@���x����{��@@���w����|��@@@���w����|��@���w����|��@@