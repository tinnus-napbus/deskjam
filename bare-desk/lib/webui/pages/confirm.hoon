/-  *deskjam
/+  sty=webui-styles, img=webui-images,
    h=deskjam
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
    mapp  ?~(staged ~ stage-mapp.u.staged)
    sour  (scot %p our.bowl)
    snow  (scot %da now.bowl)
::
++  page
  ^-  manx
  ;hmtl
    ;head
      ;title:"%deskjam"
      ;meta(charset "utf-8");
      ;meta
        =name     "viewport"
        =content  "width=device-width, initial-scale=1";
      ;style: {global:sty}
    ==
    ;body
      ;a/"/apps/deskjam": return home
      ;br;
      ;h1: confirm upload
      ;+  info
    ==
  ==
::
++  info
  ^-  manx
  =/  desk   ?>(?=(^ dest) desk.u.dest)
  =/  mode   ?>(?=(^ dest) mode.u.dest)
  =/  desks  .^((set ^desk) %cd /[sour]/base/[snow])
  ?-    mode
      %m
    =/  src=(set path)  ~(key by mapp)
    =/  snk=(set path)
      %-  ~(gas in *(set path))
      .^((list path) %ct /[sour]/[desk]/[snow])
    =/  conflict=(set path)  (~(int in src) snk)
    ;div
      ;form(method "post")
        ;table
          ;tr
              ;p: The following file conflicts exist with the existing desk  {(weld "%" (trip desk))} .
              ;p: Hit confirm to commit these changes anyway.
          ==
          ;tr
            ;button(type "submit", name "add-files"): confirm
          ==
        ==
      ==
      ;h1: file conflicts
      ;*  =/  desk  ?~(staged %$ stage-desk.u.staged)
          (folder-hierarchy desk ~(tap in conflict))
    ==
      %n
    ?:  (~(has in desks) desk)
      ;p: A desk called {(weld "%" (trip desk))} already exists.
    ;div
      ;form(method "post")
        ;table
          ;tr
            ;td
              ;p: Confirm creation of {(weld "%" (trip desk))} as a new desk?
            ==
            ;td
              ;button(type "submit", name "new-desk"): confirm
            ==
          ==
        ==
      ==
      ;h1: staged files
      ;*  =/  desk  ?~(staged %$ stage-desk.u.staged)
          (folder-hierarchy desk ~(tap in ~(key by mapp)))
    ==
  ==
::
++  folder-hierarchy
  |=  [=desk pax=(list path)]
  ^-  marl
  %+  turn  (files-to-hierarchy:hc pax)
  |=  [pat=path dir=? dep=@]
  ^-  manx
  ;tr
    ;td
      ;table
        ;tr
          ;td(width (scow %ud (mul 20 dep)));
          ;td
            ;+  ?.  =(0 dep)
                  (resource-icon:img dir)
                ;p
                  ;strong: %
                ==
          ==
          ;td
            ;+  ?:  =(0 dep)  ;/  (trip desk)
                ?:  dir  ;/  (trip (rear pat))
                ;/  =-  ?>  ?=(^ fil)  t.fil
                    fil=(spud (slag (sub (lent pat) 2) pat))
          ==
        ==
      ==
    ==
  ==
--
