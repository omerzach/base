Caml1999M019����            4commutative_group.ml����      �  Q�����*ocaml.text��&_none_A@ �A�������
  y A signature for a commutative group (in the group-theory sense).

    An implementation of this interface should have the following properties:

    1: associativity: (a+b)+c = a+(b+c) for all elt's a,b,c
    2: identity: zero+a = a+zero = a for all elt's a
    3: inverses: given any elt a there exists a (unique) elt b such that a+b=b+a=zero
    4: commutativity: a+b = b+a
@��4commutative_group.mlA@@�I|~@@@��A@@�I|~@@��A@@�I|~@������&Import��K���K��@@��K���K��@@��K���K��@�����!S�� M���!M��@������A�    �!t��-N���.N��@@@@A@@��0N���1N��@@��3N���4N��@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexp#��@������'Sexplib$Sexp!t.@.@����32@2@2@@@//���Р)sexp_of_t8��@����?>@>@������'Sexplib$Sexp!tG@G@G@@@DD@A@A@A���Р$zero��zP���{P��@����!t���P����P��@@���P����P��@@@@���P����P��@���P����P��@���Р!+���Q����Q��@��@����!t���Q����Q��@@���Q����Q��@@��@����!t���Q����Q��@@���Q����Q��@@����!t���Q���Q�@@���Q���Q�@@���Q����Q�@@���Q����Q�@@@@���Q����Q�@���Q����Q�@���Р!-���R��R@��@����!t���R��R@@���R��R@@��@����!t���R��R@@���R��R@@����!t���R��R@@���R��R@@���R��R@@���R��R@@@@���R��R@���R� R@@��M���S!@@@��M���S!@��M���	S!@@