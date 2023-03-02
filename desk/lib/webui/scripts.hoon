|%
++  subset
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
--
