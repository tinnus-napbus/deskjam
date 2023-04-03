/-  *deskjam
/+  webui, rudder, server, dbug, verb, default-agent,
    j=deskjam
::
/$  deskpack-0-to-mime  %deskpack-0  %mime
/$  deskjam-to-deskpack-0  %deskjam  %deskpack-0
::
|%
+$  state-0   [%0 data]
+$  card      card:agent:gall
--
::
=|  state-0
=*  state  -
::
%-  agent:dbug
%+  verb  |
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    jc    ~(. j [our now]:bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  :_  this
  [%pass /eyre/connect %arvo %e %connect [~ /apps/[dap.bowl]] dap.bowl]~
  
:::
++  on-save  !>(state)
::
++  on-load
  |=  ole=vase
  ^-  (quip card _this)
  =/  old=state-0  !<(state-0 ole)
  [~ this(state old)]
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %handle-http-request
    ?>  =(src our):bowl
    =+  !<([=eyre-id =inbound-request:eyre] vase)
    ?.  authenticated.inbound-request
      [(login-redirect:hc eyre-id) this]
    =/  ,request-line:server
      (parse-request-line:server url.request.inbound-request)
    :: download the jam file of a desk
    ::
    ?:  ?=([%apps %deskjam %download ~] site)
      =/  [=desk files=(list path)]
        %+  roll  args
        |=  [[k=@t v=@t] [=desk files=(list path)]]
        ?+  k  [desk files]
          %desk  [(need ((sand %tas) v)) files]
          %path  ?~  file=(rush v stap)
                   [desk files]
                 [desk [u.file files]]
        ==
      :_  this
      ?~  files
        (simple-deskjam:hc eyre-id desk)
      (simple-sub-deskjam:hc eyre-id desk files)
    :: clear staged on index visit
    ::
    =?  staged  ?=([%apps %deskjam ~] site)  ~
    :: use rudder to serve pages
    ::
    =/  pages  make-pages:hc
    =;  out=(quip card data)
      [-.out this(+.state +.out)]
    %.  [bowl [eyre-id inbound-request] staged dest]
    %:  (steer:rudder data action)
      pages
      (point:rudder /apps/[dap.bowl] & ~(key by pages))
      (fours:rudder staged dest)
      |=  axn=action
      ^-  $@  brief:rudder
          [brief:rudder (list card) data]
      =^  caz  this
        (on-poke %deskjam-action !>(axn))
      ['Processed succesfully.' caz staged dest]
    ==
    ::
      %deskjam-action
    =/  axn  !<(action vase)
    ?>  =(src our):bowl
    ?-    -.axn
        %stage-mapp
      `this(staged [~ now.bowl [desk mapp]:axn])
      ::
        %url-thread
      :_(this ~[(run-url-thread-card url.axn)])
      ::
        %set-dest
      `this(dest [~ [mode desk]:axn])
      ::
        %new-desk
      ?>  =(src our):bowl
      ?>  ?=(^ dest)
      ?>  ?=(%n mode.u.dest)
      ?>  ?=(^ staged)  =,  u.staged
      ?<  (~(has in desks:hc) desk.u.dest)
      :_(this [(new-desk-card desk.u.dest stage-mapp)]~)
      ::
        %add-files
      ?>  =(src our):bowl
      ?>  ?=(^ dest)
      ?>  ?=(%m mode.u.dest)
      ?>  ?=(^ staged)  =,  u.staged
      ?>  (~(has in desks:hc) desk.u.dest)
      =/  src=(set path)  ~(key by stage-mapp)
      =/  snk=(set path)  (desk-files:hc desk.u.dest)
      =/  conflict=(set path)  (~(int in src) snk)
      :: this overwrites conflicting filepaths
      :_  this
      [(add-files-card stage-mapp desk.u.dest conflict)]~
    ==
  ==
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?>  =(our.bowl src.bowl)
  ?+  path  (on-watch:def path)
    [%http-response *]  [~ this]
  ==
::
++  on-agent  on-agent:def
++  on-peek   on-peek:def
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+    wire  (on-arvo:def wire sign-arvo)
      [%eyre %connect ~]
    ?>  ?=([%eyre %bound *] sign-arvo)
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    [~ this]
    ::
      [%url-thread ~]
    ?>  ?=([%khan %arow %.y %noun *] sign-arvo)
    =/  [%khan %arow %.y %noun result=vase]  sign-arvo
    =/  =jam  !<(jam result)
    :_  this
    :~  :*  %pass  /  %agent  [our dap]:bowl  %poke 
            %deskjam-action  !>([%stage-mapp (deskjam-to-deskpack-0 jam)])
    ==  ==
  ==
::
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
|_  =bowl:gall
++  sour  (scot %p our.bowl)
++  snow  (scot %da now.bowl)
++  desks  .^((set desk) %cd /[sour]/base/[snow])
::
++  new-desk-card
  |=  [=desk =mapp]
  ^-  card
  [%pass /new-desk/[desk] %arvo (new-desk:cloy desk ~ mapp)]
::
++  add-files-card
  |=  [=mapp to=desk conflict=(set path)]
  ^-  card
  =;  =soba:clay
    [%pass /put-files/[to] %arvo %c %info to %& soba]
  %+  turn  ~(tap by mapp)
  |=  [=path =mark cont=*]
  ?:  (~(has in conflict) path)
    [path %mut mark !>(cont)]
  [path %ins mark !>(cont)]
::
++  run-url-thread-card
  |=  url=@t
  ^-  card
  :*  %pass  /url-thread  %arvo  %k  %fard
      %deskjam  %deskjam-url  %noun
      !>((some url))
  ==
::
++  desk-files
  |=  =desk
  ^-  (set path)
  %-  ~(gas in *(set path))
  .^((list path) %ct /[sour]/[desk]/[snow])
::
++  page-paths
  ^-  (list path)
  ~[/index /staged /confirm /subset]
::
++  make-pages
  %-  ~(gas by *(map @ta (page:rudder data action)))
  (turn page-paths make-page:webui)
::
++  en-mapp
  |=  [=desk files=(list path)]
  ^-  mapp
  =+  .^(=dome:clay %cv /[sour]/[desk]/[snow])
  =/  commit=@ud  ud:.^(cass:clay %cw /[sour]/[desk]/[snow])
  =/  =tako:clay  (~(got by hit.dome) commit)
  =+  .^(=yaki:clay %cs /[sour]/base/[snow]/yaki/(scot %uv tako))
  =+  .^(=rang:clay %cx /[sour]//[snow]/rang)
  %-  ~(gas by *mapp)
  %+  turn  files
  |=  file=path
  ^-  (pair path page:clay)
  ~|  [%missing-source-file /[sour]/[desk]/[snow] file]
  :-  file
  (~(got by lat.rang) (~(got by q.yaki) file))
::
++  en-mapp-full
  |=(=desk (en-mapp desk ~(tap in (desk-files desk))))
::
++  en-mapp-part
  |=  [=desk files=(list path)]
  =/  desk-files=(set path)  (desk-files desk)
  %+  en-mapp  desk
  %+  murn  files
  |=  file=path
  ?.((~(has in desk-files) file) ~ (some file))
::
++  desk-to-mime
  |=  =desk
  ^-  mime
  %-  deskpack-0-to-mime
  [desk (en-mapp-full desk)]
::
++  subdesk-to-mime
  |=  [=desk files=(list path)]
  ^-  mime
  %-  deskpack-0-to-mime
  [desk (en-mapp-part desk files)]
::
++  simple-deskjam
  |=  [=eyre-id =desk]
  ^-  (list card)
  =/  jamm  (desk-to-mime desk)
  %+  give-simple-payload:app:server  eyre-id
  :_  [~ q.jamm]
  :-  200
  :~  ['content-type' (en-mite:mimes:html p.jamm)]
      :-  'Content-Disposition'
      %-  crip
      "attachment; filename=\"{(trip desk)}.deskjam\""
  ==
::
++  simple-sub-deskjam
  |=  [=eyre-id =desk files=(list path)]
  ^-  (list card)
  =/  jamm  (subdesk-to-mime desk files) 
  %+  give-simple-payload:app:server  eyre-id
  :_  [~ q.jamm]
  :-  200
  :~  ['content-type' (en-mite:mimes:html p.jamm)]
      :-  'Content-Disposition'
      %-  crip
      "attachment; filename=\"{(trip desk)}-subset.deskjam\""
  ==
::
++  login-redirect
  |=  =eyre-id
  ^-  (list card)
  %+  give-simple-payload:app:server  eyre-id
  [[307 ['Location' '/~/login?redirect=%2Fapps%2Fdeskjam'] ~] ~]
--
