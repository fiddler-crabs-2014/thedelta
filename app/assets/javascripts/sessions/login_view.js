$(document).ready(function(){
  if(this_page("SessionsController", "login")){

    if (document.referrer.indexOf(window.location.hostname) > 0 ) {
      $('#referer_url').val(document.referrer);
    };

  };
});
