/-  *deskjam
/+  sty=webui-styles, img=webui-images,
    h=deskjam
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
    mapp  ?~(staged ~ stage-mapp.u.staged)
    desk  ?~(staged %$ stage-desk.u.staged)
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
      ;table
        ;tr
          ;td
            ;div.box
              ;p: Stage a desk to merge with:
              ;form(method "post")
                ;table
                  ;tr
                    ;td
                      ;select(name "old-desk")
                        ;*  %+  turn  ~(tap in desks:hc)
                            |=  =^desk
                            ;option(value "{(trip desk)}"): {(trip desk)}
                      ==
                    ==
                    ;td
                      ;button(type "submit"): submit
                    ==
                  ==
                ==
              ==
            ==
          ==
          ;td
            ;div.box
              ;p: OR - Name a new desk to create:
              ;form(method "post")
                ;table
                  ;tr
                    ;td
                      ;input(type "text", name "new-desk", size "12");
                    ==
                    ;td
                      ;button(type "submit"): submit
                    ==
                  ==
                ==
              ==
            ==
          ==
        ==
      ==
      ;h2: staged files
      ;p: (If loaded from url, you may want to refresh.)
      ;*  folder-hierarchy
    ==
  ==
++  folder-hierarchy
  ^-  marl
  %+  turn
    (files-to-hierarchy:hc ~(tap in ~(key by mapp)))
  |=  [pat=path dir=? dep=@]
  ^-  manx
  ;tr
    ;td
      ;table
        ;tr
          ;td(width (a-co:co (mul 20 dep)));
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
