/-  *jam-desk
/+  webui, rudder, server, dbug, verb, default-agent,
    j=jam-desk
:: import to force compilation during development
/=  j-  /mar/jam-desk-0
::
|%
+$  state-0   [%0 data]
+$  card      card:agent:gall
++  jam-mark  %jam-desk-0
++  desks     |=(=beak .^((set desk) %cd (en-beam beak ~)))
::
++  jam-to-mime
  |=  =beak
  .^  $-(@ mime)  %cf
    (weld (en-beam beak(q %base) ~) /jam/mime)
  ==
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
      %jam-desk  %jam-desk-url  %noun
      !>((some url))
  ==
::
++  desk-files
  |=  =beak
  ^-  (set path)
  %-  ~(gas in *(set path))
  .^((list path) %ct (en-beam beak ~))
::
++  page-paths
  |=  =beak
  ^-  (list path)
  =/  subsets
    (turn ~(tap in (desks beak)) |=(=@ta [%subset ta ~]))
  %+  welp
    subsets
  ~[/index /staged /confirm /download]
::
++  make-pages
  |=  =beak
  %-  ~(gas by *(map @ta (page:rudder data action)))
  (turn (page-paths beak) make-page:webui)
::
++  en-mapp
  |=  [=beak files=(list path)]
::  ^-  mapp
::  |^
::  (~(gas by *mapp) (turn files mage))
::  ++  mage
::    |=  file=path
::    ^-  (pair path page:clay)
::    :-  file
::    ^-  page:clay
::    :-  (rear file)
::    ~|  [%missing-source-file beak file]
::    .^(* %cx (weld (en-beam beak ~) file))
::  --
  ^-  mapp
  =+  .^(=dome:clay %cv (en-beam beak ~))
  =/  commit=@ud
    ?-  r.beak
      [%ud @]   p.r.beak
      [%tas @]  (~(got by lab.dome) p.r.beak)
      [%da @]   ud:.^(cass:clay %cw (en-beam beak /))
    ==
  =/  =tako:clay  (~(got by hit.dome) commit)
  =+  .^(=yaki:clay %cs (en-beam beak(q %base) /yaki/(scot %uv tako)))
  =/  case
    ?-  -.r.beak
      %da   (scot %da p.r.beak)
      %tas  (scot %tas p.r.beak)
      %ud   (scot %ud p.r.beak)
    ==
  ~&  %before-rang
  =+  .^(=rang:clay %cx (en-beam beak(q %$) /rang))
  ~&  %after-rang
  %-  ~(gas by *mapp)
  %+  turn  files
  |=  file=path
  ^-  (pair path page:clay)
  ~|  [%missing-source-file beak file]
  :-  file
  (~(got by lat.rang) (~(got by q.yaki) file))
::
++  en-mapp-full
  |=(=beak (en-mapp beak ~(tap in (desk-files beak))))
::
++  en-mapp-part
  |=  [=beak files=(list path)]
  %+  en-mapp  beak
  %+  murn  files
  |=  file=path
  ?.((~(has in (desk-files beak)) file) ~ (some file))
::
++  desk-to-mime
  |=  =beak
  %-  (jam-to-mime beak)
  %-  jam  ^-  (cask)
  [jam-mark q.beak (en-mapp-full beak)]
::
++  file-args
  |=  args=(list [k=@t v=@t])
  ^-  (list path)
  %+  turn  args
  |=  [k=@t v=@t]
  ^-  path
  +:(rash k stap)
::
++  subdesk-to-mime
  |=  [=beak files=(list path)]
  %-  (jam-to-mime beak)
  %-  jam  ^-  (cask)
  [jam-mark q.beak (en-mapp-part beak files)]
::
++  simple-desk-jam
  |=  [=eyre-id =beak]
  ^-  (list card)
  =/  jamm  (desk-to-mime beak)
  %+  give-simple-payload:app:server  eyre-id
  :_  [~ q.jamm]
  [200 ['content-type'^(en-mite:mimes:html p.jamm)]~]
::
++  simple-subdesk-jam
  |=  [=eyre-id =beak args=(list [k=@t v=@t])]
  ^-  (list card)
  =/  jamm  (subdesk-to-mime beak (file-args args)) 
  %+  give-simple-payload:app:server  eyre-id
  :_  [~ q.jamm]
  :-  200
  :~  'content-type'^(en-mite:mimes:html p.jamm)
      :-  'Content-Disposition'
      %-  crip
      "inline; filename=\"{(trip q.beak)}-subset.jam\""
  ==
--
::
=|  state-0
=*  state  -
::
%-  agent:dbug
%+  verb  |
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. j [our now]:bowl)
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
    ::
    =+  !<([=eyre-id =inbound-request:eyre] vase)
    =/  ,request-line:server
      (parse-request-line:server url.request.inbound-request)
    :: download the jam file of a desk
    ::
    ?:  ?=([%apps %jam-desk %download @ta ~] site)
      =/  =desk  i.t.t.t.site
      :_  this
      ?~  args
        (simple-desk-jam eyre-id byk.bowl(q desk))
      (simple-subdesk-jam eyre-id byk.bowl(q desk) args)
    :: clear staged on index visit
    ::
    =?  staged  ?=([%apps %jam-desk ~] site)  ~
    :: use rudder to serve pages
    ::
    =/  pages  (make-pages byk.bowl)
    =;  out=(quip card _+.state)
      [-.out this(+.state +.out)]
    %.  [bowl !<(order:rudder vase) +.state]
    %:  (steer:rudder _+.state action)
      pages
      (point:rudder /apps/[dap.bowl] & ~(key by pages))
      (fours:rudder +.state)
      |=  axn=action
      ^-  $@  brief:rudder
          [brief:rudder (list card) _+.state]
      =^  caz  this
        (on-poke %jam-desk-action !>(axn))
      ['Processed succesfully.' caz +.state]
    ==
    ::
      %jam-desk-action
    =/  axn  !<(action vase)
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
      ?<  (~(has in (desks byk.bowl)) desk.u.dest)
      :_(this [(new-desk-card desk.u.dest stage-mapp)]~)
      ::
        %add-files
      ?>  =(src our):bowl
      ?>  ?=(^ dest)
      ?>  ?=(%m mode.u.dest)
      ?>  ?=(^ staged)  =,  u.staged
      ?>  (~(has in (desks byk.bowl)) desk.u.dest)
      =/  src=(set path)  ~(key by stage-mapp)
      =/  snk=(set path)  (desk-files byk.bowl(q desk.u.dest))
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
            %jam-desk-action  !>(stage-mapp+(cue-and-clam:hc jam))
    ==  ==
  ==
::
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
