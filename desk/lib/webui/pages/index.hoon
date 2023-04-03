/-  *deskjam
/+  sty=webui-styles, scr=webui-scripts, img=webui-images, h=deskjam
|_  [=bowl:gall data]
+*  hc  ~(. h [our now]:bowl)
    mapp  ?~(staged ~ stage-mapp.u.staged)
++  page
  ^-  manx
  ;html
    ;head
      ;title: Deskjam
      ;meta(charset "utf-8");
      ;meta
        =name     "viewport"
        =content  "width=device-width, initial-scale=1";
      ;style: {global:sty}
      ;script: {download-form:scr}
    ==
    ;body
      ;+  upload-jamfile
      ;br;
      ;br;
      ;+  download-jamfile
    ==
  ==
::
++  upload-jamfile
  ^-  manx
  ;div(style "max-width: 50ch; width: 100%")
    ;h2: upload deskjam
    ;p: Upload a deskjam from your computer or a url.
    ;br;
    ;form
      =method   "post"
      =enctype  "multipart/form-data"
      =action   "/apps/deskjam"
      =class    "justified-form"
      ;input
        =id        "file-select"
        =type      "file"
        =name      "file"
        =accept    ".deskjam"
        =required  "required";
      ;input(type "submit", value "submit");
    ==
    ;form(method "post", class "justified-form")
      ;input
        =type         "url"
        =name         "url"
        =placeholder  "https://www.example.com"
        =required     "required"
        =style        "max-width: 30ch; width: 100%;";
      ;input(type "submit", value "submit");
    ==
  ==
::
++  download-jamfile
  ^-  manx
  ;div(style "max-width: 50ch; width: 100%;")
    ;h2: download deskjam
    ;p: Download a whole desk, or check "subset" to select files.
    ;br;
    ;form
      =id      "download-form"
      =method  "get"
      =action  "/apps/deskjam/download"
      =class   "justified-form"
      ;select(name "desk", required "required")
        ;*  %+  turn  (sort ~(tap in desks:hc) aor)
            |=  =desk
            ^-  manx
            ;option(value (trip desk)): {(trip desk)}
      ==
      ;span
        ;label(for "subset-checkbox"): subset:
        ;input
          =id       "subset-checkbox"
          =type     "checkbox"
          =onclick  "changeDownloadFormAction()";
      ==
      ;input(type "submit", value "submit");
    ==
  ==
--
