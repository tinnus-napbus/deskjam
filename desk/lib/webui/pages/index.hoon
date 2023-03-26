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
      ;a/"/apps/deskjam/download": downloads page
      ;br;
      ;*  upload-jamfile
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
--
