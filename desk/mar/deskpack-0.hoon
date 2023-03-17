/-  *jam-desk
=,  mimes:html
|_  dp=deskpack
++  grow
  |%
  ++  noun      dp
  ++  deskjam   jam
  ++  jam       (^jam [%deskpack-0 dp])
  ++  mime      :-  /application/octet-stream
                (as-octs:mimes:html jam)
  --
++  grab
  |%
  ++  noun     deskpack
  ++  deskjam  jam
  ++  jam
    |=  mud=@
    =/  =(cask)  ;;((cask) (cue mud))
    ?+  p.cask  ~|([%unknown-deskjam-mark mark=p.cask] !!)
      %deskpack-0  ;;(deskpack q.cask)
    ==
  ++  mime  |=(mim=^mime (jam q.q.mim))
  --
++  grad  %noun
--
