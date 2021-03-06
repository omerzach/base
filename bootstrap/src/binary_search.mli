Caml1999N018����            1binary_search.mli����  T  k    
������*ocaml.text��&_none_A@ �A�������
  e
   General functions for performing binary searches over ordered sequences given
   [length] and [get] functions.  These functions can be specialized and added to
   a data structure using the functors supplied in [Binary_searchable] and described
   in [Binary_searchable_intf].

   {0:Examples}

   Below we assume that the function [get], [length] and [compare] are in scope:

   {[
     (* find the index of an element [e] in [t] *)
     binary_search t ~get ~length ~compare `First_equal_to e;

     (* find the index where an element [e] should be inserted *)
     binary_search t ~get ~length ~compare `First_greater_than_or_equal_to e;

     (* find the index in [t] where all elements to the left are less than [e] *)
     binary_search_segmented t ~get ~length ~segment_of:(fun e' ->
       if compare e' e <= 0 then `Left else `Right) `First_on_right
   ]}
@��1binary_search.mliA@@�Vhj@@@��A@@�Vhj@@��A@@�Vhj@������&Import��Xlr�Xlx@@��Xll�Xlx@@��Xll�Xlx@���Р-binary_search�� kko�!kk|@���#pos����#int��,l}��-l}�@@��/l}��0l}�@@���#len����#int��;m���<m��@@��>m���?m��@@��@��!t��Fn���Gn��@@���&length��@��!t��Ro���So��@@����#int��Zo���[o��@@��]o���^o��@@��`o���ao��@@���#get��@��!t��lp���mp��@@��@����#int��vp���wp��@@��yp���zp��@@��#elt��p����p��@@���p����p��@@���p����p��@@���'compare��@��#elt���q����q��@@��@��#elt���q����q��@@����#int���q����q��@@���q����q��@@���q����q��@@���q����q��@@��@����7Last_strictly_less_than���)ocaml.docÐ������	) {v | < elt X |                       v} @���r�!��r�O@@@���r�!��r�O@@@A@��:Last_less_than_or_equal_to���)ocaml.docؐ������	) {v |      <= elt       X |           v} @���sPx��sP�@@@���sPx��sP�@@@A@��-Last_equal_to���)ocaml.doc퐠�����	) {v           |   = elt X |           v} @���t����t��@@@���t����t��@@@A@��.First_equal_to���)ocaml.doc�������	) {v           | X = elt   |           v} @���u�&� u�T@@@��u�&�u�T@@@A@��>First_greater_than_or_equal_to���)ocaml.doc�������	) {v           | X       >= elt      | v} @��vU}�vU�@@@��vU}�vU�@@@A@��;First_strictly_greater_than���)ocaml.doc,�������	) {v                       | X > elt | v} @��)w���*w�	@@@��,w���-w�	@@@A@@@@��/r���0x			@@��@��#elt��7y	
	�8y	
	@@����&option��?z		�@z		#@�����#int��Hz		�Iz		@@��Kz		�Lz		@@@��Nz		�Oz		#@@��Qy	
	�Rz		#@@��Tr���Uz		#@@��Wq���Xz		#@@��Zp���[z		#@@��]o���^z		#@@��`n���az		#@@��cm���dz		#@@��fl}��gz		#@@@���)ocaml.docx�������
  � [binary_search ?pos ?len t ~length ~get ~compare which elt] takes [t] that is sorted
    in nondecreasing order according to [compare], where [compare] and [elt] divide [t]
    into three (possibly empty) segments:

    {v
      |  < elt  |  = elt  |  > elt  |
    v}

    [binary_search] returns the index in [t] of an element on the boundary of segments
    as specified by [which].  See the diagram below next to the [which] variants.

    By default, [binary_search] searches the entire [t].  One can supply [?pos] or
    [?len] to search a slice of [t].

    [binary_search] does not check that [compare] orders [t], and behavior is
    unspecified if [compare] doesn't order [t].  Behavior is also unspecified if
    [compare] mutates [t]. @��uZzz�vjMj@@@��xZzz�yjMj@@@��{kkk�|z		#@��~kkk�z		#@���Р7binary_search_segmented��� N���� N��@���#pos����#int��� O���� O��@@��� O���� O��@@���#len����#int��� P���� P��@@��� P���� P��@@��@��!t��� Q���� Q��@@���&length��@��!t��� R��� R�@@����#int��� R��� R�@@��� R��� R�@@��� R��� R�@@���#get��@��!t��� S �� S"@@��@����#int��� S&�� S)@@��� S&�� S)@@��#elt��� S-�� S1@@��� S&�� S1@@��� S �� S1@@���*segment_of��@��#elt��� T3D�� T3H@@����$Left@A@��%Right@A@@@@�� T3L� T3^@@�� T3D� T3^@@��@����,Last_on_left@A@��.First_on_right@A@@@@�� U`e� U`�@@����&option�� V��� V��@�����#int��$ V���% V��@@��' V���( V��@@@��* V���+ V��@@��- U`e�. V��@@��0 T38�1 V��@@��3 S�4 V��@@��6 R��7 V��@@��9 Q���: V��@@��< P���= V��@@��? O���@ V��@@@���)ocaml.docQ�������
  � [binary_search_segmented ?pos ?len t ~length ~get ~segment_of which] takes a
    [segment_of] function that divides [t] into two (possibly empty) segments:

    {v
      | segment_of elt = `Left | segment_of elt = `Right |
    v}

    [binary_search_segmented] returns the index of the element on the boundary of the
    segments as specified by [which]: [`Last_on_left] yields the index of the last
    element of the left segment, while [`First_on_right] yields the index of the first
    element of the right segment.  It returns [None] if the segment is empty.

    By default, [binary_search] searches the entire [t].  One can supply [?pos] or
    [?len] to search a slice of [t].

    [binary_search_segmented] does not check that [segment_of] segments [t] as in the
    diagram, and behavior is unspecified if [segment_of] doesn't segment [t].  Behavior
    is also unspecified if [segment_of] mutates [t]. @��N|	%	%�O M��@@@��Q|	%	%�R M��@@@��T N���U V��@��W N���X V��@@