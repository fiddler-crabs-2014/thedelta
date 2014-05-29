$(document).ready(function(){
  if(this_page("UsersController", "new")){
    if (document.referrer.indexOf(window.location.hostname) > 0 ) {
      $('#referrer_url').val(document.referrer);
      $('#base_url').val(window.location.origin);
    };
  };
});