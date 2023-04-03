/-  *deskjam
/+  multipart
|_  [our=ship now=time]
++  sour  (scot %p our)
++  snow  (scot %da now)
++  desks  .^((set desk) %cd /[sour]/base/[snow])
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
++  desk-files  |=(=desk .^((list path) %ct /[sour]/[desk]/[snow]))
::
++  desk-to-hierarchy
  |=  =desk
  ^-  (list [pat=path dir=? dep=@])
  (files-to-hierarchy (desk-files desk))
::
++  file-to-ancestors
  |=  pat=path
  ^-  (list path)
  (path-to-ancestors pat |)
::
++  path-to-ancestors
  |=  [pat=path dir=?]
  ^-  (list path)
  =.  pat  (flop pat)
  =?  pat  !dir  ?>(?=([@ @ *] pat) t.t.pat)
  =|  out=(list path)
  |-
  ?~  pat  [/ out]
  $(pat t.pat, out [(flop pat) out])
::
++  path-to-classes
  |=  [pat=path dir=?]
  ^-  tape
  (zing (join " " (turn (path-to-ancestors pat dir) spud)))
::
++  files-to-hierarchy
  |=  pax=(list path)
  ^-  (list [pat=path dir=? dep=@])
  =|  out=(set [pat=path dir=? dep=@])
  |-
  ?~  pax  (sort ~(tap in out) aor)
  =/  new=(list [pat=path dir=? dep=@])
    :-  [i.pax | (sub (lent i.pax) 1)]
    %+  turn  (file-to-ancestors i.pax)
    |=(p=path [p & (lent p)])
  $(pax t.pax, out (~(gas in out) new))
--
