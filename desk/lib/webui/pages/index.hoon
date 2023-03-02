/-  *jam-desk
/+  sty=webui-styles, img=webui-images,
    h=jam-desk
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
    mapp  ?~(staged ~ stage-mapp.u.staged)
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
      ;*  upload-jamfile
    ==
  ==
::
++  upload-jamfile
  ^-  marl 
  :~  ;h2: upload jamfile
      ;p: Upload a desk jamfile from your computer.
      ;table
        ;form
          =method   "post"
          =enctype  "multipart/form-data"
          ;tr
            ;td
              ;input
                =type         "file"
                =name         "file"
                =accept       ".jam";
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
      ==
  ==
--
