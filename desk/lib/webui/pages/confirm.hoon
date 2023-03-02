/-  *jam-desk
/+  sty=webui-styles, img=webui-images,
    h=jam-desk
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
      ;title:"%jam-desk"
      ;meta(charset "utf-8");
      ;meta
        =name     "viewport"
        =content  "width=device-width, initial-scale=1";
      ;style:"{(trip global:sty)}"
    ==
    ;body
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
  %+  turn
    (get-hier:hc desk pax)
  |=  [n=@ f=? d=(list path) p=path]
  ^-  manx
  ;tr
    ;td
      ;table
        ;tr
          ;td(width (scow %ud (mul 20 n)));
          ;td
            ;+  ?.  =(0 n)
                  (resource-icon:img f)
                ;p
                  ;strong: %
                ==
          ==
          ;td: {(trip (rear p))}
        ==
      ==
    ==
  ==
--
