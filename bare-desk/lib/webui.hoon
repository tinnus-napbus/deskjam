/-  *deskjam
/+  rudder, multipart, w=webui-pages, h=deskjam
/$  deskjam-to-deskpack-0  %deskjam  %deskpack-0
|%
++  path-to-term
  |=  =path
  ^-  term
  (crip (zing (join "-" (turn path trip))))
::
++  make-page
  |=  paz=path
  ^-  (pair @ta (page:rudder data action))
  :-  (path-to-term paz)
  ^-  (page:rudder data action)
  ~|  paz
  ?+    paz  !!
    [%index ~]    index
    [%staged ~]   staged
    [%confirm ~]  confirm
    [%subset ~]   subset
  ==
::
++  index
  |_  [=bowl:gall * =data]
  +*  hc  ~(. h [our now]:bowl)
  ++  argue
    |=  [headers=header-list:http body=(unit octs)]
    ^-  $@(brief:rudder action)
    =/  parts  (de-request:multipart headers body)
    ?~  parts
      =/  args=(map @t @t)
        ?~(body ~ (frisk:rudder q.u.body))

      ?~  url=(~(get by args) 'url')  ~
      [%url-thread u.url]
    =/  jam=(unit jam)
      %-  lint:hc
      ^-  (list jam)
      %+  murn  u.parts
      |=  [n=@t p=part:multipart]
      ^-  (unit jam)
      ?+  n  ~
        %file  [~ `jam`body:p]
      ==
    ?~  jam   ~
    [%stage-mapp (deskjam-to-deskpack-0 u.jam)]
  ::
  ++  final
    %+  alert:rudder
      (spat /apps/[dap.bowl]/staged)
    ~(build staged +<)
  ::
  ++  build
    |=  $:  arg=(list [k=@t v=@t])
            msg=(unit [o=? =@t])
        ==
    ^-  reply:rudder
    [%page ~(page index:w [bowl data])]
  --
::
++  staged
  |_  [=bowl:gall * =data]
  +*  hc  ~(. h [our now]:bowl)
  ++  argue
    |=  [headers=header-list:http body=(unit octs)]
    ^-  $@(brief:rudder action)
    =/  args=(map @t @t)
      ?~(body ~ (frisk:rudder q.u.body))
    =/  old-desk=(unit desk)  (~(get by args) 'old-desk')
    =/  new-desk=(unit desk)  (~(get by args) 'new-desk')
    ?+  d=[old-desk new-desk]  !!
      [^ ~]  [%set-dest %m u.-.d]
      [~ ^]  [%set-dest %n u.+.d]
    ==
  ::
  ++  final
    %+  alert:rudder
      (spat /apps/[dap.bowl]/confirm)
    ~(build confirm +<)
  ::
  ++  build
    |=  $:  arg=(list [k=@t v=@t])
            msg=(unit [o=? =@t])
        ==
    ^-  reply:rudder
    [%page ~(page staged:w [bowl data])]
  --
::
++  confirm
  |_  [=bowl:gall * =data]
  +*  hc  ~(. h [our now]:bowl)
  ++  argue
    |=  [headers=header-list:http body=(unit octs)]
    ^-  $@(brief:rudder action)
    =/  args=(map @t @t)
      ?~(body ~ (frisk:rudder q.u.body))
    =/  rags=[? ?]
      :-  (~(has by args) 'add-files')
      (~(has by args) 'new-desk')
    ?+  rags  !!
      [%& %|]  [%add-files ~]
      [%| %&]  [%new-desk ~]
    ==
  ::
  ++  final
    %+  alert:rudder
      (spat /apps/[dap.bowl])
    ~(build index +<)
  ::
  ++  build
    |=  $:  arg=(list [k=@t v=@t])
            msg=(unit [o=? =@t])
        ==
    ^-  reply:rudder
    [%page ~(page confirm:w [bowl data])]
  --
::
++  subset
  |_  [=bowl:gall * data]
  +*  hc  ~(. h [our now]:bowl)
  ++  argue
    |=  [headers=header-list:http body=(unit octs)]
    ^-  $@(brief:rudder action)
    =/  args=(map @t @t)
      ?~(body ~ (frisk:rudder q.u.body))
    =/  pax=(list path)
      (turn ~(tap in ~(key by args)) (curr rash stap))
    :: ~&  (turn pax spat)
    ~
  ::
  ++  final  (alert:rudder (spat /apps/[dap.bowl]) build)
  ::
  ++  build
    |=  $:  arg=(list [k=@t v=@t])
            msg=(unit [o=? =@t])
        ==
    ^-  reply:rudder
    =/  dex=desk
      %-  need
      %-  (sand %tas)
      (~(got by (~(gas by *(map @t @t)) arg)) 'desk')
    [%page ~(page subset:w [bowl dex])]
  --
--
