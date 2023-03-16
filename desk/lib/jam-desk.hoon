/-  *jam-desk
/+  multipart
|_  [our=ship now=time]
++  en-beak  |=(dap=term /(scot %p our)/[dap]/(scot %da now))
++  jam-to-mime  .^($-(@ mime) %cf (welp (en-beak %base) /jam/mime))
++  desks  .^((set desk) %cd (en-beak %base))
::
++  cue-and-clam
  |=  =jam
  ^-  [desk mapp]
  =/  =(cask)  ((cask) (cue jam))
  ?+    p.cask  !!
      %jam-desk-0
    (,[desk mapp] q.cask)
  ==
:: list to unit
::
++  lint
  |*  =(list)
  ^-  (unit _?>(?=(^ list) i.list))
  ~|  %cannot-convert-multiple-to-unit
  ?>  ?=(?(~ [* ~]) list)
  ?~(list ~ (some i.list))
::
++  grab
  |*  [=mold key=@t parts=(list [@t part:multipart])]
  %-  lint
  ^-  (list mold)
  %+  murn  parts
  |=  [n=@t p=part:multipart]
  ^-  (unit mold)
  ?.  =(key n)  ~
  [~ `mold`body:p]
::
++  desk-files  |=(=desk .^((list path) %ct (en-beak desk)))
::
++  desk-axal
  |=  =desk
  ^-  (axal)
  (get-axal (desk-files desk))
::
++  get-axal
  |=  files=(list path)
  ^-  (axal)
  |^  %-  ~(gas of *(axal))
  %+  turn
    (turn files fuse-ext)
  |=(=path [path ~])
  ++  fuse-ext
    |=  =path
    =/  end=^path  (flop (scag 2 (flop path)))
    =/  nam=tape  (trip (snag 0 end))
    =/  ext=tape  (trip (snag 1 end))
    %-  flop
    :_  (oust [0 2] (flop path))
    (crip :(weld nam "/" ext))
  --
::
++  get-desk-hier
  |=  =desk
  ^-  (list [n=@ f=? d=(list path) p=path])
  (get-hier desk (desk-files desk))
::
++  get-hier
  |=  [name=term files=(list path)]
  ^-  (list [n=@ f=? d=(list path) p=path])
  =/  dax=(axal)  (get-axal files)
  =/  fat=(axal)  dax
  =|  n=@
  =/  pat=path  [name ~]
  |-  ^-  (list [@ ? (list path) path])
  =/  pax  :: paths of all contents
    %+  turn
      ~(tap of fat)
    |=([p=path *] (weld (flop pat) p))
  =/  sed  [[n f=| pax (flop pat)] ~]
  ?:  =(0 ~(wyt by dir.fat))  sed
  =/  kids  ~(tap by dir.fat)
  %+  welp  sed(f &)
  =|  out=(list [@ ? (list path) path])
  |-
  ?~  kids  out
  %=  $
    kids  t.kids
    out   %+  weld  out
          %=  ^$
            n    +(n)
            pat  [p.i.kids pat]
            fat  q.i.kids
          ==
  ==
::
++  path-to-tape
  |=  =path
  ^-  tape
  (zing (join "-" (turn path trip)))
::
++  path-to-ancs
  |=  =path
  ^-  (list ^path)
  (snip (turn (gulf 1 (lent path)) (curr scag path)))
::
++  path-to-classes
  |=  =path
  ^-  tape
  (zing (join " " (turn (path-to-ancs path) path-to-tape)))
--
