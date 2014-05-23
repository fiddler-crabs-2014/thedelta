 $.fn.refresh = function() {
    return $(this.selector);
  };

$(function(){
  var state = [0];
  var start = false;
  var start_time = 0;
  var time_from_start = 0;
  var stop_time = 0;

  $("#start").on("click", function(){
    start = true;
    start_time = Date.now();
  });

  $("#stop").on("click", function(){
    start = false;
    stop_time = time_from_start;
  });

  $("#save").on("click", function(){
    start = true;
    start_time = Date.now();
  });

  $("#play").on("click", function(){
    $("#view").html(state[0][0])
    state.forEach(function(step){
      setTimeout(function(){
        $("#view").html(step[0]);
      },step[1]);
    });
  });


  if(!start){
    state[state.length-1] = [$("form textarea").val(), 0]
  };


  $("form textarea").on("input", function(){
    if(start){
      time_from_start = Date.now() - start_time + stop_time;

      add_string = $("form textarea").val();
      add_string = add_string.replace(/</g,"&lt;");
      add_string = add_string.replace(/>/g,"&gt;");
      state.push([add_string, time_from_start]);
      state.forEach(function(stat){
        console.log(stat[0] + " " + stat[1]);
      });
    };
  });

  $("textarea").keydown(function(e) {
    if(e.keyCode === 9) { // tab was pressed
      var start = this.selectionStart;
      var end = this.selectionEnd;
      var $this = $(this);
      var value = $this.val();

      $this.val(value.substring(0, start)
                  + "\t"
                  + value.substring(end));

      this.selectionStart = this.selectionEnd = start + 1;

      e.preventDefault();
    }
    if (e.keyCode === 13) {
        e.preventDefault();
        var start = $(this).val();
        $(this).val(start+"\n");
     };
  });
});