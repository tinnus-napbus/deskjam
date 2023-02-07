/-  *jam-desk
/+  rudder, multipart
^-  (page:rudder data action)
:: helper core
=>
  |_  [=bowl:gall * data]
  ++  en-beak  |=(dap=term /(scot %p our.bowl)/[dap]/(scot %da now.bowl))
  ++  jam-to-mime  .^($-(@ mime) %cf (welp (en-beak %base) /jam/mime))
  ++  desks  .^((set desk) %cd (en-beak %base))
  ++  lint
    |*  =(list)
    ^-  (unit _?>(?=(^ list) i.list))
    ~|  %cannot-convert-multiple-to-unit
    ?>  (lte (lent list) 1)
    ?~(list ~ (some i.list))
  ::
  ++  desk-files
    |=  =desk
    =/  files  .^((list path) %ct (en-beak desk))
    %+  murn
      files
    |=  f=path
    ^-  (unit path)
    ?.(.^(? %cu (weld (en-beak desk) f)) ~ (some f))
  ::
  ++  desk-axal
    |=  =desk
    ^-  (axal)
    |^  %-  ~(gas of *(axal))
    %+  turn
      (turn (desk-files desk) fuse-ext)
    |=(=path [path ~])
    ++  fuse-ext
      |=  =path
      =/  end=^path  (flop (scag 2 (flop path)))
      =/  nam=tape  (trip (snag 0 end))
      =/  ext=tape  (trip (snag 1 end))
      %-  flop
      :_  (oust [0 2] (flop path))
      (crip :(weld nam "/" ext))
    --
  ::
  ++  mapp
    |=  [=desk files=(list path)]
    ^-  (map path page:clay)
    |^
    =|  mapp=(map path page:clay)
    (~(gas by mapp) (turn files mage))
    ++  mage
      |=  file=path
      ^-  (pair path page:clay)
      :-  file
      ^-  page:clay
      :-  (rear file)
      ~|  [%missing-source-file desk file]
      .^(* %cx (weld (en-beak desk) file))
    --
  ::
  ++  get-hier
    |=  =desk
    ^-  (list [n=@ f=? d=(list path) p=path])
    =/  dax=(axal)  (desk-axal desk)
    =/  fat=(axal)  dax
    =|  n=@
    =/  pat=path  [desk ~]
    |-  ^-  (list [@ ? (list path) path])
    =/  pax  :: paths of all contents
      %+  turn
        ~(tap of fat)
      |=([p=path *] (weld (flop pat) p))
    =/  sed  [[n f=| pax (flop pat)] ~]
    ?:  =(0 ~(wyt by dir.fat))  sed
    =/  kids  ~(tap by dir.fat)
    %+  welp  sed(f &)
    =|  out=(list [@ ? (list path) path])
    |-
    ?~  kids  out
    %=  $
      kids  t.kids
      out   %+  weld  out
            %=  ^$
              n    +(n)
              pat  [p.i.kids pat]
              fat  q.i.kids
            ==
    ==
  ::
  ++  path-to-tape  |=(=path `tape`(zing (join "-" (turn path trip))))
  ::
  ++  path-to-ancs
    |=  =path
    ^-  (list ^path)
    (snip (turn (gulf 1 (lent path)) (curr scag path)))
  ::
  ++  path-to-classes
    |=  =path
    ^-  tape
    (zing (join " " (turn (path-to-ancs path) path-to-tape)))
  --
|_  [=bowl:gall * data]
+*  hc  ~(. +> +<)
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder action)
  =/  parts  (de-request:multipart headers body)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  =/  den=(map @t (list path))
    %-  ~(gas by *(map @t (list path)))
    %+  turn
      (get-hier:hc %sailbox)
    |=  [* * d=(list path) p=path]
    [(spat p) d]
  =/  files
    %-  zing
    %+  turn
      ~(tap by args)
    |=  [k=@t v=@t]
    %+  turn
      (~(gut by den) k ~)      :: get descendents of key
    |=(p=path ?>(?=(^ p) t.p)) :: clear desk-name prefix
  ~&  files
  :: ~&  (turn files |=(f=path .^(* %cx :(welp (en-beak %sailbox) f))))
  =/  jamm  (jam-to-mime:hc (jam (mapp:hc %sailbox files)))
  ~&  jamm
  ?~  parts  ~
  =/  desk=(unit desk)
    %-  lint:hc
    ^-  (list desk)
    %+  murn  u.parts
    |=  [n=@t p=part:multipart]
    ^-  (unit desk)
    ?+  n  ~
      %desk  [~ `desk`body:p]
    ==
  =/  jam=(unit jam)
    %-  lint:hc
    ^-  (list jam)
    %+  murn  u.parts
    |=  [n=@t p=part:multipart]
    ^-  (unit jam)
    ?+  n  ~
      %file  [~ `jam`body:p]
    ==
  ?~  desk  ~
  ?~  jam   ~
  [%create-desk u.desk u.jam]
::
++  final  (alert:rudder (cat 3 '/' dap.bowl) build)
::
++  build
  |=  $:  arg=(list [k=@t v=@t])
          msg=(unit [o=? =@t])
      ==
  ^-  reply:rudder
  |^  [%page page]
  ++  style
    '''
    * { margin: 0.2em; padding: 0.01em; font-family: monospace; }
    body {
      margin: 0;
      padding: 0;
      width: 100vw;
      height: 100vh;
      display: flex;
      flex-direction: column;
    }
    '''
  ++  script
    '''
    function selectSubfiles(anc) {
      const root    = document.querySelector("#" + anc);
      const checked = root.checked;
      console.log("TEST");
      const boxes   = document.querySelectorAll("." + anc);
      for (let i = 0; i < boxes.length; i++) {
        boxes[i].checked = checked;
      }
    }
    '''
  ++  page
    ^-  manx
    ;hmtl
      ;head
        ;title:"%jam-desk"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;style:"{(trip style)}"
        ;script:"{(trip script)}"
      ==
      ;body
        ;*  uploader
        ;br;
        ;br;
        ;+  (display-desk %sailbox)
        ;br;
        ;br;
        ;*  desker
      ==
    ==
  ++  display-desk
    |=  =desk
    ^-  manx
    ;form(method "post")
      ;table
        ;tr
          ;td
            Select files and folders to jam.
          ==
          ;td
            ;button(type "submit", name "action", value "download-partial"):"download"
          ==
        ==
        ;*  %+  turn  (get-hier:hc desk)
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
                        =onchange  "selectSubfiles(\"{(path-to-tape p)}\")";
                    ==
                    ;td(width (scow %ud (mul 20 n)));
                    ;td
                      ;+  ?.  =(0 n)
                            (icon f)
                          ;p
                            ;strong: %
                          ==
                    ==
                    ;td: {(trip (rear p))}
                  ==
                ==
              ==
            ==
      ==
    ==
++  uploader
  ^-  marl  
  :~  ;h1: Upload a Desk
      ;table
        ;form(method "post", enctype "multipart/form-data")
          ;tr
            ;td
              ;button(type "submit", name "action", value "submit-file"):"submit"
            ==
            ;td
              ;input(type "desk-name", name "desk", placeholder "desk name");
            ==
            ;td
              ;input(type "file", accept ".jam", name "file");
            ==
          ==
        ==
      ==
  ==
  ++  desker
   ^-  marl
    :~  ;h1: Download a Desk
        ;table
          ;*  %+  turn  ~(tap in desks:hc)
              |=  =desk
              ;tr
                ;td: {(trip desk)}
                ;td(width "18");
                ;td
                  ;a/"/jam-desk/download/{(trip desk)}"
                    =id  "download"
                    =download  "{(trip desk)}.jam"
                    =title  "download this file"
                    ; ⬇️
                  ==
                ==
              ==
        ==
    ==
  ++  icon  |=(f=? `manx`?:(f folder-svg document-svg))
  ++  folder-svg
    ^-  manx  ~+
    ;svg
      =xmlns    "http://www.w3.org/2000/svg"
      =viewBox  "0 0 100 100"
      =width    "15"
      =height   "15"
      =fill     "#FFF"
      ;path
        =fill  "#FFB900"
        =d  "M45,24l-4.2426-4.2426C39.6321,18.6321,38.106,18,36.5147,18H9c-1.6569,0-3,1.3431-3,3v56 c0,0.5523,0.4477,1,1,1h82c0.5523,0,1-0.4477,1-1V27c0-1.6569-1.3431-3-3-3H45z";
      ;path
        =fill  "#FFD75E"
        =d  "M45,24l-4.2426,4.2426C39.6321,29.3679,38.106,30,36.5147,30H6v47c0,0.5523,0.4477,1,1,1h82 c0.5523,0,1-0.4477,1-1V27c0-1.6569-1.3431-3-3-3H45z";
      ;linearGradient
        =id  "a"
        =x1  "48"
        =y1  "24"
        =y2  "78"
        =gradientUnits  "userSpaceOnUse"
        ;stop(offset "0", stop-color "#fff", stop-opacity "0");
        ;stop(offset "1", stop-color "#ffd75e", stop-opacity ".3");
      ==
      ;path
        =fill  "url(#a)"
        =d  "M45,24l-4.2426,4.2426C39.6321,29.3679,38.106,30,36.5147,30H6v47c0,0.5523,0.4477,1,1,1h82 c0.5523,0,1-0.4477,1-1V27c0-1.6569-1.3431-3-3-3H45z";
      ;path
        =fill  ".4"
        =d  "M6,30v1h30.6005c1.8565,0,3.637-0.7375,4.9497-2.0503L46.5,24H45l-4.2426,4.2426 C39.6321,29.3679,38.106,30,36.5147,30H6z";
      ;path
        =fill  "#DA7B16"
        =d  "M89,78H7c-0.5523,0-1-0.4477-1-1l0,0h84l0,0C90,77.5523,89.5523,78,89,78z";
    ==
  ++  document-svg
    ^-  manx  ~+
    ;svg
      =width    "15"
      =height   "15"
      =viewbox  "0 0 100 100"
      =fill     "none"
      =xmlns    "http://www.w3.org/2000/svg"
      ;path
        =d  "M83.012,17.5c0-0.527-0.271-0.99-0.682-1.258L66.477,2.637c-0.15-0.129-0.324-0.211-0.505-0.271C65.709,2.141,65.373,2,65,2 H18.5C17.671,2,17,2.671,17,3.5v93c0,0.828,0.671,1.5,1.5,1.5h63c0.828,0,1.5-0.672,1.5-1.5V18c0-0.067-0.011-0.13-0.02-0.195 C83.001,17.707,83.012,17.604,83.012,17.5z M20,95V5h44v12.5c0,0.829,0.672,1.5,1.5,1.5H80v76H20z"
        =stroke  "black"
        =stroke-width  "3";
      ;path
        =d  "M69,31H31c-0.552,0-1-0.448-1-1s0.448-1,1-1h38c0.553,0,1,0.448,1,1S69.553,31,69,31z"
        =stroke  "black"
        =stroke-width  "3";
      ;path
        =d  "M69,45H31c-0.552,0-1-0.448-1-1s0.448-1,1-1h38c0.553,0,1,0.448,1,1S69.553,45,69,45z"
        =stroke  "black"
        =stroke-width  "3";
      ;path
        =d  "M69,57H31c-0.552,0-1-0.447-1-1s0.448-1,1-1h38c0.553,0,1,0.447,1,1S69.553,57,69,57z"
        =stroke  "black"
        =stroke-width  "3";
      ;path
        =d  "M69,71H31c-0.552,0-1-0.447-1-1s0.448-1,1-1h38c0.553,0,1,0.447,1,1S69.553,71,69,71z"
        =stroke  "black"
        =stroke-width  "3";
    ==
  --
--
