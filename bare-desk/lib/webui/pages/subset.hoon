/-  *deskjam
/+  sty=webui-styles, scr=webui-scripts, img=webui-images,
    h=deskjam
|_  [=bowl:gall =desk]
+*  hc  ~(. h [our now]:bowl)
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
      ;script: {subset:scr}
    ==
    ;body
      ;a/"/apps/deskjam": return home
      ;br;
      ;+  display-desk
    ==
  ==
++  display-desk
  ^-  manx
  ;form(method "get", action "/apps/deskjam/download")
    ;input(type "hidden", name "desk", value (trip desk));
    ;table
      ;tr
        ;td: Select files and folders to jam.
        ;td
          ;input(type "submit", value "submit");
        ==
      ==
      ;*  folder-hierarchy
    ==
  ==
++  folder-hierarchy
  ^-  marl
  %+  turn  (desk-to-hierarchy:hc desk)
  |=  [pat=path dir=? dep=@]
  =/  tpath=tape  (spud pat)
  ^-  manx
  ;tr
    ;td
      ;table
        ;tr
          ;td
            ;+  ?:  dir
                  ;input
                    =id        tpath
                    =type      "checkbox"
                    =class     (path-to-classes:hc pat dir)
                    =onchange  "checkboxDir(\"{tpath}\")";
                ;input
                  =id        tpath
                  =type      "checkbox"
                  =name      "path"
                  =value     tpath
                  =class     (path-to-classes:hc pat dir);
          ==
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
