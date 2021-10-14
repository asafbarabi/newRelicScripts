//DO NOT CHANGE THE SCRIPT HERE!!!
//This is a source controled script 
//if you want to change it, do it throuch the source control: https://github.com/asafbarabi/newRelicScripts


$browser.get("${uri}").then(function(){
  $browser.sleep(2000).then(function(){
      $browser.takeScreenshot();
  })
});