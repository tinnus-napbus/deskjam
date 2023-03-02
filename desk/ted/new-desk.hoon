/-  spider, *jam-desk
/+  *strandio, j=jam-desk
=,  strand=strand:spider
|%
+$  card  card:agent:gall
++  new-desk-card
  |=  [=desk =mapp]
  ^-  card
  [%pass /new-desk/[desk] %arvo (new-desk:cloy desk ~ mapp)]
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
++  desk-files
  |=  [=desk our=ship now=time]
  ^-  (set path)
  %-  ~(gas in *(set path))
  .^  (list path)  %ct
    /(scot %p our)/[desk]/(scot %da now)
  ==
--
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=/  [=mapp to=desk safe=?]
  (need !<((unit [mapp desk ?]) arg))
;<  =bowl:spider  bind:m  get-bowl
=/  desks  .^((set desk) %cd (en-beam byk.bowl ~))
?.  (~(has in desks) to)
  =/  =card  (new-desk-card to mapp)
  ;<  ~  bind:m  (send-raw-card card)
  (pure:m arg)
=/  from-files  ~(key by mapp)
=/  to-files    (desk-files to [our now]:bowl)
=/  conflict=(set path)  (~(int in from-files) to-files)
?:  &(safe (lth 0 ~(wyt in conflict)))
  (strand-fail:strand %path-conflict ~)
=/  =card  (add-files-card mapp to conflict)
;<  ~  bind:m  (send-raw-card card)
(pure:m arg)
