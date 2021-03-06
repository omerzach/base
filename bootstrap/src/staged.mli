Caml1999N018����            *staged.mli����  F   �  4  ������*ocaml.text��&_none_A@ �A�������
  g A type for making staging explicit in the type of a function.  For example, you might
    want to have a function that creates a function for allocating unique identifiers.
    Rather than using the type:

    {[
    val make_id_allocator : unit -> unit -> int
    ]}

    you would have

    {[
    val make_id_allocator : unit -> (unit -> int) Staged.t
    ]}

    Such a function could be defined as follows:

    {[
    let make_id_allocator () =
      let ctr = ref 0 in
      stage (fun () -> incr ctr; !ctr)
    ]}

    and could be invoked as follows:

    {[
    let (id1,id2) =
      let alloc = unstage (make_id_allocator ()) in
      (alloc (), alloc ())
    ]}

    both stage and unstage functions are available in Common.

    (Note that in many cases, including perhaps the one above, it's preferable to create a
    custom type rather than use Staged.)
@��*staged.mliA@@�cjl@@@��A@@�cjl@@��A@@�cjl@������&Import��ent�enz@@��enn�enz@@��enn�enz@���A�    �!t��!g|��"g|�@����!a��)g|��*g|�@@@@@@A@@��,g||�-g|�@@��/g||�0g|�@���Р%stage��8i���9i��@��@��!a��@i���Ai��@@����!t��Hi���Ii��@���!a��Oi���Pi��@@@��Ri���Si��@@��Ui���Vi��@@@@��Xi���Yi��@��[i���\i��@���Р'unstage��dj���ej��@��@����!t��nj���oj��@���!a��uj���vj��@@@��xj���yj��@@��!a��~j���j��@@���j����j��@@@@���j����j��@���j����j��@@