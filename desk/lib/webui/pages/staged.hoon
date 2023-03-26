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
      ;style:"{(trip global:sty)}"
    ==
    ;body
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
    (get-hier:hc desk ~(tap in ~(key by mapp)))
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
