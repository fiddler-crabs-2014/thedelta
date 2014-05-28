$( document ).ready(function() {

  var player  = new Player({
      play_sel: "#Play",
      view_sel: "#view",
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

  var tab_key = 9;
  var enter_key = 13;

  var editor = new Editor("#recorder textarea", [[tab_key,"\t"],
                                                 [enter_key,"\n"]]);

  editor.initialize_event_listener();

});

function Recorder(args) {
  console.log("Function starts: Recorder");
    this.textarea_sel = args.textarea_sel;
    this.record_sel = args.record_sel;
    this.reset_sel = args.reset_sel;
    this.view_sel = args.view_sel;
    this.save_sel = args.save_sel;
    this.player = args.player;
    this.player.disable();


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

Recorder.prototype.inrecord = function() {

    $(this.record_sel).on("click", function() {

        if (!this.start) {
            this.start = true;

            this.player.disable();
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
        this.player.disable();
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

