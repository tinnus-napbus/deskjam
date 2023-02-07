/-  *jam-desk
/+  rudder, server, dbug, verb, default-agent
/~  pages  (page:rudder data action)  /app/jam-desk/webui
|%
+$  state-0  [%0 data]
+$  card  card:agent:gall
--
=|  state-0
=*  state  -
=>
  |_  =bowl:gall
  ++  en-beak  |=(=desk /(scot %p our.bowl)/[desk]/(scot %da now.bowl))
  ++  jam-to-mime  .^($-(@ mime) %cf (welp (en-beak %base) /jam/mime))
  ++  desk-files  |=(=desk .^((list path) %ct (en-beak desk)))
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
      ~|  [%missing-source-file %base file]
      .^(* %cx (welp (en-beak desk) file))
    --
  ::
  ++  get-hier
    |=  =desk
    ^-  (list [@ ? (list path) @ta])
    =/  dax=(axal)  (desk-axal desk)
    =/  fat=(axal)  dax
    =|  n=@
    =/  =@ta  desk
    =|  pat=path
    |-  ^-  (list [@ ? (list path) @ta])
    =/  pax  :: paths of all contents
      %+  turn
        ~(tap of fat)
      |=([p=path *] (weld (flop pat) p))
    =/  sed  [[n f=& pax ta] ~]
    ?:  =(0 ~(wyt by dir.fat))  sed
    =/  kids  ~(tap by dir.fat)
    %+  welp  sed(f |)
    =|  out=(list [@ ? (list path) @ta])
    |-
    ?~  kids  out
    %=  $
      kids  t.kids
      out   %+  weld  out
            %=  ^$
              n    +(n)
              ta   p.i.kids
              pat  [p.i.kids pat]
              fat  q.i.kids
            ==
    ==
  --
%-  agent:dbug
%+  verb  |
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  :_  this
  [%pass /eyre/connect %arvo %e %connect [~ /[dap.bowl]] dap.bowl]~
::
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
    =+  !<([=eyre-id =inbound-request:eyre] vase)
    =/  ,request-line:server
      (parse-request-line:server url.request.inbound-request)
    ?:  ?=([%jam-desk %download @ta ~] site)
      =/  =desk  i.t.t.site
      =/  jamm  (jam-to-mime:hc (jam (mapp:hc desk (desk-files desk))))
      :_  this
      %+  give-simple-payload:app:server  eyre-id
      :_  [~ q.jamm]
      [200 ['content-type'^(en-mite:mimes:html p.jamm)]~]
    =;  out=(quip card _+.state)
      [-.out this(+.state +.out)]
    %.  [bowl !<(order:rudder vase) +.state]
    %:  (steer:rudder _+.state action)
      pages
      (point:rudder /[dap.bowl] & ~(key by pages))
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
    =/  action  !<(action vase)
    ?-    -.action
        %do-a-thing
      ~&  "Do a thing..."
      `this
      ::
        %do-another
      ~&  "Do another..."
      ~&  (get-hier:hc %jam-desk)
      `this
      ::
        %add-ship
      ~&  "Adding ship..."
      `this(ships [ship.action ships])
      ::
        %create-desk
      ~&  "Creating desk..."
      ~|  %already-exists
      ?<  (~(has in .^((set desk) %cd (en-beak:hc %base))) desk.action)
      =/  mapp=(map path page:clay)
        ~|  %invalid-desk-jam
        ((map path page:clay) (cue jam.action))
      :_  this
      :~  :*  %pass  /create-desk/[desk.action]  %arvo
          (new-desk:cloy desk.action ~ mapp)
      ==  ==
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
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+    wire  (on-arvo:def wire sign-arvo)
      [%eyre %connect ~]
    ?>  ?=([%eyre %bound *] sign-arvo)
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    [~ this]
  ==
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
