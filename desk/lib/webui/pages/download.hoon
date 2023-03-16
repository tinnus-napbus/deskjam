/-  *jam-desk
/+  sty=webui-styles, h=jam-desk
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
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
      ;a/"/apps/jam-desk": uploads page
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
                ;a/"/apps/jam-desk/subset-{(trip desk)}": {(trip desk)}
              ==
              ;td(width "18");
              ;td
                ;a/"/apps/jam-desk/download/{(trip desk)}"
                  =id  "download"
                  =download  "{(trip desk)}.jam"
                  =title  "download this file"
                  ; ⬇️
                ==
              ==
            ==
      ==
  ==
--
