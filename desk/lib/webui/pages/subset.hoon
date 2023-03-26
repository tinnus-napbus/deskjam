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
      ;style:"{(trip global:sty)}"
      ;script:"{(trip subset:scr)}"
    ==
    ;body
      ;+  display-desk
    ==
  ==
++  display-desk
  ^-  manx
  ;form(method "get", action "/apps/deskjam/download/{(trip desk)}")
    ;table
      ;tr
        ;td
          Select files and folders to jam.
        ==
        ;td
          ;button(type "submit", download "{(trip desk)}.deskjam"): download
        ==
      ==
      ;*  folder-hierarchy
    ==
  ==
++  folder-hierarchy
  ^-  marl
  %+  turn  (get-desk-hier:hc desk)
  |=  [n=@ f=? d=(list path) p=path]
  ^-  manx
  ;tr
    ;td
      ;table
        ;tr
          ;td
            ;input
              =id        "{(path-to-tape:hc p)}"
              =type      "checkbox"
              =name      "{(spud p)}"
              =class     "{(path-to-classes:hc p)}"
              =onchange  "selectSubfiles(\"{(path-to-tape:hc p)}\")";
          ==
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
