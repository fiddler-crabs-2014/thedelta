
 $.fn.refresh = function() {
    return $(this.selector);
  };

$( document ).ready(function() {


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
      }
    }
  })(jQuery)


    var player  = new Player({
        play_sel: "#Play",
        view_sel: "#view",
        load_sel: ""
    });

    var recorder = new Recorder({
        textarea_sel: "#recorder textarea",
        record_sel: "#Record",
        view_sel: "#view",
        reset_sel: "#reset",
        save_sel: "#Save",
        player: player
    });


    recorder.record();
    recorder.reset();



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


function Recorder(args) {
  console.log("Function starts: Recorder");
    this.textarea_sel = args.textarea_sel;
    this.record_sel = args.record_sel;
    this.reset_sel = args.reset_sel;
    this.view_sel = args.view_sel;
    this.save_sel = args.save_sel;
    this.player = args.player;
    this.player.disable_btn();


    this.state = [0];
    this.start = false;
    this.start_time = 0;
    this.time_from_start = 0;
    this.stop_time = 0;

};

Recorder.prototype.enable_save = function() {
  $(this.save_sel).removeAttr('disabled');
};

Recorder.prototype.disable_save = function() {
  $(this.save_sel).attr('disabled','disabled');
};

Recorder.prototype.record = function() {

    $(this.record_sel).on("click", function() {

        if (!this.start) {
            this.start = true;

            this.player.disable_btn();
            this.state[this.state.length - 1] = [$(this.textarea_sel).val(), this.stop_time];
            $("#record-btn").removeClass("record-off");
            $("#record-btn").addClass("record-on");
            this.player.update_state(this.state);
        } else {
            if(this.state.length > 1) {
              this.player.enable_btn();
              this.enable_save();
            };
            this.start = false;
            this.stop_time = this.time_from_start;

            $("#record-btn").removeClass("record-on");
            $("#record-btn").addClass("record-off");
            this.player.update_state(this.state);

        };

        this.start_time = Date.now();
        $("#answer_delta").focus();
        
    }.bind(this));
    
    this.player.play(this.state);

    $(this.textarea_sel).on("input", function() {
        if (this.start) {
            this.time_from_start = Date.now() - this.start_time + this.stop_time;
            var add_string = $(this.textarea_sel).val();

            add_string = add_string.replace(/</g, "&lt;");
            add_string = add_string.replace(/>/g, "&gt;");

            this.state.push([add_string, this.time_from_start]);
            this.player.update_state(this.state);
        };
    }.bind(this));
};


Recorder.prototype.reset = function() {
    $(this.reset_sel).on("click", function() {
        this.player.disable_btn();
        this.disable_save();

        $(this.view_sel).empty();
        $(this.textarea_sel).val(this.state[0][0]);

        this.state = [0];
        this.start = false;
        this.stop_time = 0;
        this.start_time = 0;
        this.time_from_start = 0;
        this.player.update_state(this.state);
    }.bind(this));
};


Recorder.prototype.save = function() {
    this.disable_save();

    $("form[name=recorder]").submit(function(e) {
        e.preventDefault();

        var question_id = parseInt($('#answer_question_id').attr('value'));
        var user_id = parseInt($('#answer_user_id').attr('value'));

        $("#loader").removeClass("hidden");
        $("#loader").addClass("show");

        $.post("/answers/create.json", {
            delta: this.state,
            question_id: question_id,
            user_id: user_id
        }, function(response) {
            window.location.replace("/questions/" + response.question_id);

        }.bind(this), "JSON");
    }.bind(this));
};

