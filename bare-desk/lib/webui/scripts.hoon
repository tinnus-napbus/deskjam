|%
++  subset
  ^~
  ^-  tape
  %-  trip
  '''
  function checkboxDir(path) {
    const {checked, className} = document.getElementById(path);
    Array.from(document.getElementsByClassName(className))
      .forEach(e => e.checked = checked);
  };
  '''
++  download-form
  ^~
  ^-  tape
  %-  trip
  '''
  function changeDownloadFormAction(){
    if (document.getElementById("subset-checkbox").checked == true) {
      document.getElementById("download-form").action = "/apps/deskjam/subset";
    } else {
      document.getElementById("download-form").action = "/apps/deskjam/download";
    }
  }
  '''
--
