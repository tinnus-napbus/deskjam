/-  *deskjam
/+  sty=webui-styles, img=webui-images,
    h=deskjam
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
    mapp  ?~(staged ~ stage-mapp.u.staged)
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
      ;*  upload-jamfile
      ;br;
      ;*  download-jamfile
    ==
  ==
::
++  upload-jamfile
  ^-  marl 
  :~  ;h2: upload jamfile
      ;p: Upload a desk jamfile from your computer or from a url.
      ;table
        ;form
          =method   "post"
          =enctype  "multipart/form-data"
          ;tr
            ;td
              ;input
                =type         "file"
                =name         "file"
                =accept       ".deskjam";
            ==
            ;td
              ;button
                =type         "submit"
                =name         "action"
                =value        "submit-file"
                submit
              ==
            ==
          ==
        ==
        ;form
          =method   "post"
          ;tr
            ;td
              ;input
                =type         "text"
                =name         "url"
                =placeholder  "https://www.example.com";
            ==
            ;td
              ;button
                =type         "submit"
                =name         "action"
                =value        "submit-url"
                submit
              ==
            ==
          ==
        ==
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
        ;*  :-  ;tr
                  ;th:"desk subset"
                  ;th(width "18");
                  ;th:"full desk"
                ==
            %+  turn  ~(tap in desks:hc)
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
