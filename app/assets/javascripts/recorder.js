
 $.fn.refresh = function() {
    return $(this.selector);
  };

$(document).on('page:load',function(){

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
    })(jQuery)



    var recorder = new Recorder({
        textarea_sel: "#recorder textarea",
        record_sel: "#Record",
        stop_sel: "#Stop",
        view_sel: "#view",
        clear_sel: "#Clear",
    });


    recorder.record();
    recorder.stop();
    recorder.clear();

    var player  = new Player({
        play_sel: "#Play",
        view_sel: "#view"
    });

    player.play(recorder.state);
    recorder.save();

    $("textarea").keydown(function(e) {

        var tabKey = 9;
        var enterKey = 13;

        formattingKeyPress(tabKey, "\t", e, this);
        formattingKeyPress(enterKey, "\n", e, this);

    });

});



function formattingKeyPress(key, substitute, event, myObj) {

    if (event.keyCode === key) { // tab was pressed
        event.preventDefault();

        var $myObj = $(myObj);
        var start = $myObj.caret();
        var value = $myObj.val();

        $myObj.val(value.substring(0, start) + substitute + value.substring(start));
        $myObj.caret(start + 1);
    }
};

function Player(args) {
    this.play_sel = args.play_sel;
    this.view_sel = args.view_sel;
};

Player.prototype.play = function(states) {
    $(this.view_sel).html(states[0][0]);
    $(document).on("click", this.play_sel, function() {
      var view_sel = this.view_sel

        if (!(states instanceof Array)) {
            states = $.map(states, function(value, index) {
                return [value];
            });
        };

        states.forEach(function(step) {

            setTimeout(function() {
                
          console.log(view_sel);
                $(view_sel).html(step[0]);
            }, step[1]);

        }.bind(this));

    }.bind(this));
}

function Recorder(args) {
    this.textarea_sel = args.textarea_sel;
    this.record_sel = args.record_sel;
    this.stop_sel = args.stop_sel;
    this.clear_sel = args.clear_sel;
    this.view_sel = args.view_sel;

    this.state = [0];
    this.start = false;
    this.start_time = 0;
    this.time_from_start = 0;
    this.stop_time = 0;

};

Recorder.prototype.record = function() {

    $(this.record_sel).on("click", function() {

        if (!this.start) {
            this.state[this.state.length - 1] = [$(this.textarea_sel).val(), this.stop_time];
        };

        this.start = true;
        this.start_time = Date.now();
        $(this.textarea_sel).caret(0);
    }.bind(this));

    $(this.textarea_sel).on("input", function() {
        if (this.start) {
            this.time_from_start = Date.now() - this.start_time + this.stop_time;

            var add_string = $(this.textarea_sel).val();
            add_string = add_string.replace(/</g, "&lt;");
            add_string = add_string.replace(/>/g, "&gt;");

            this.state.push([add_string, this.time_from_start]);

        };
    }.bind(this));
};


Recorder.prototype.stop = function() {

    $(this.stop_sel).on("click", function() {
        this.start = false;
        this.stop_time = this.time_from_start;
    }.bind(this));

};


Recorder.prototype.clear = function() {
    $(this.clear_sel).on("click", function() {
        $(this.view_sel).empty();

        this.state = [0];
        this.start = false;
        this.stop_time = 0;
        this.start_time = 0;
        this.time_from_start = 0;
    }.bind(this));
};


Recorder.prototype.save = function() {
    $("form[name=recorder]").submit(function(e) {
        e.preventDefault();
        $("#loader").removeClass("hidden");
        $("#loader").addClass("show");

        $.post("/answers/create.json", {
            delta: this.state
        }, function(response) {
            window.location.replace("/questions/" + response.question_id);

        }.bind(this), "JSON");
    }.bind(this));
};
