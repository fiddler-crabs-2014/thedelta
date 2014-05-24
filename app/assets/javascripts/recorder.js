
 $.fn.refresh = function() {
    return $(this.selector);
  };

$(function(){

  (function($) {
    $.fn.caret = function(pos) {
      var target = this[0];
      var isContentEditable = target.contentEditable === 'true';
      //get
      if (arguments.length == 0) {
        //HTML5
        if (window.getSelection) {
          //contenteditable
          if (isContentEditable) {
            target.focus();
            var range1 = window.getSelection().getRangeAt(0),
                range2 = range1.cloneRange();
            range2.selectNodeContents(target);
            range2.setEnd(range1.endContainer, range1.endOffset);
            return range2.toString().length;
          }
          //textarea
          return target.selectionStart;
        }
        //IE<9
        if (document.selection) {
          target.focus();
          //contenteditable
          if (isContentEditable) {
              var range1 = document.selection.createRange(),
                  range2 = document.body.createTextRange();
              range2.moveToElementText(target);
              range2.setEndPoint('EndToEnd', range1);
              return range2.text.length;
          }
          //textarea
          var pos = 0,
              range = target.createTextRange(),
              range2 = document.selection.createRange().duplicate(),
              bookmark = range2.getBookmark();
          range.moveToBookmark(bookmark);
          while (range.moveStart('character', -1) !== 0) pos++;
          return pos;
        }
        //not supported
        return 0;
      }
      //set
      if (pos == -1)
        pos = this[isContentEditable? 'text' : 'val']().length;
      //HTML5
      if (window.getSelection) {
        //contenteditable
        if (isContentEditable) {
          target.focus();
          window.getSelection().collapse(target.firstChild, pos);
        }
        //textarea
        else
          target.setSelectionRange(pos, pos);
      }
      //IE<9
      else if (document.body.createTextRange) {
        var range = document.body.createTextRange();
        range.moveToElementText(target);
        range.moveStart('character', pos);
        range.collapse(true);
        range.select();
      }
      if (!isContentEditable)
        target.focus();
      return pos;
    }
  })(jQuery)




  var state = [0];
  var start = false;
  var start_time = 0;
  var time_from_start = 0;
  var stop_time = 0;

  $("#Record").on("click", function(){
    if(!start){
      state[state.length-1] = [$("form textarea").val(), stop_time];
    };

    start = true;
    start_time = Date.now();
  });

  $("#Stop").on("click", function(){
    start = false;
    stop_time = time_from_start;
  });

  $("#Clear").on("click", function(){
    $("#view").empty();
    state = [0];
    start = false;
    stop_time = 0;
    start_time = 0;
    time_from_start = 0;
  });

  $("#Play").on("click", function(){
    $("#view").html(state[0][0])
    state.forEach(function(step){
      setTimeout(function(){
        $("#view").html(step[0]);
      },step[1]);
    });
  });


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


  $("form[name=recorder]").submit(function(e){
    e.preventDefault();
 
    $.post("/answers/create.json", {delta: state}, function(response){

      var play_state = $.map(response, function(value, index) {
        return [value];
      });

      $("#view").html(play_state[0][0])

      play_state.forEach(function(step){

        setTimeout(function(){
          $("#view").html(step[0]);
        },step[1]);

      });

    },"JSON");
  });


  $("textarea").keydown(function(e) {
    if(e.keyCode === 9) { // tab was pressed
      e.preventDefault();
      var $this = $(this);
      var start = $this.caret();
      var value = $this.val();

      $this.val(value.substring(0, start)
                  + '\t'
                  + value.substring(start));
      $this.caret(start+1);
    }

    if (e.keyCode === 13) {
      e.preventDefault();
      var $this = $(this);
      var start = $this.caret();
      var value = $this.val();
      $this.val(value.substring(0, start)
          + '\n'
          + value.substring(start));

      $this.caret(start+1);
    };
  });
});