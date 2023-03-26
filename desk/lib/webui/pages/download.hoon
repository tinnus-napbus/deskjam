/-  *deskjam
/+  sty=webui-styles, h=deskjam
|_  [=bowl:gall data]
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
    ==
    ;body
      ;a/"/apps/deskjam": uploads page
      ;br;
      ;*  download-jamfile
    ==
  ==
::
++  download-jamfile
  ^-  marl
  :~  ;h2: download jamfile
      ;p: Download a desk from your ship to your computer.
      ;p
        Click on the desk name to select a subset of
        files in that desk.
      ==
      ;table
        ;*  %+  turn  ~(tap in desks:hc)
            |=  =desk
            ;tr
              ;td
                ;a/"/apps/deskjam/subset-{(trip desk)}": {(trip desk)}
              ==
              ;td(width "18");
              ;td
                ;a/"/apps/deskjam/download/{(trip desk)}"
                  =id  "download"
                  =download  "{(trip desk)}.deskjam"
                  =title  "download this file"
                  ; ⬇️
                ==
              ==
            ==
      ==
  ==
--
