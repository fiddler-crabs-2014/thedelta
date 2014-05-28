function Recorder(args) {
    this.textarea_selector = args.textarea_selector;
    this.record_selector = args.record_selector;
    this.reset_selector = args.reset_selector;
    this.view_selector = args.view_selector;
    this.save_selector = args.save_selector;
    this.player = args.player;
    this.player.disable();


    this.states = [0];
    this.start = false;
    this.start_time = 0;
    this.time_from_start = 0;
    this.stop_time = 0;

};

Recorder.prototype.enable_save = function() {
  $(this.save_selector).removeAttr('disabled');
};

Recorder.prototype.disable_save = function() {
  $(this.save_selector).attr('disabled','disabled');
};

Recorder.prototype.toggle_record_light = function() {
  console.log("hi");
  console.log($("#record-light"));
  if($("#record-light").hasClass("record-off")) {

    $("#record-light").removeClass("record-off");
    $("#record-light").addClass("record-on");

  } else {
    
    $("#record-light").removeClass("record-on");
    $("#record-light").addClass("record-off");
    
  };
};

Recorder.prototype.recording_exists = function() {
  this.states.length > 1;
};

Recorder.prototype.initialize_base_recording_state = function () {
  this.states[this.states.length - 1] = [$(this.textarea_selector).val(), this.stop_time];
  console.log(this.states[this.states.length - 1]);
};

Recorder.prototype.record = function() {

    $(this.record_selector).on("click", function() {
        this.toggle_record_light();

        if (!this.start) {
            this.start = true;

            this.player.disable();
            this.initialize_base_recording_state();
            this.player.update_state(this.states);

        } else {

            if(this.recording_exists) {

              this.player.enable();
              this.enable_save();

            };

            this.start = false;
            this.stop_time = this.time_from_start;
            this.player.update_state(this.states);

        };

        this.start_time = Date.now();
        $("#answer_delta").caret(0);
        
    }.bind(this));
    
    this.player.play(this.states);

    $(this.textarea_selector).on("input", function() {
        if (this.start) {
            this.time_from_start = Date.now() - this.start_time + this.stop_time;
            var add_string = $(this.textarea_selector).val();

            add_string = add_string.replace(/</g, "&lt;");
            add_string = add_string.replace(/>/g, "&gt;");

            this.states.push([add_string, this.time_from_start]);
            this.player.update_state(this.states);
        };
    }.bind(this));
};


Recorder.prototype.reset = function() {
    $(this.reset_selector).on("click", function() {
        this.player.disable();
        this.disable_save();

        $(this.view_selector).empty();
        $(this.textarea_selector).val(this.states[0][0]);

        this.states = [0];
        this.start = false;
        this.stop_time = 0;
        this.start_time = 0;
        this.time_from_start = 0;
        this.player.update_state(this.states);
    }.bind(this));
};


Recorder.prototype.save = function() {
    this.disable_save();

    $("form[name=recorder]").submit(function(e) {
        e.preventDefault();

        var question_id = parseInt($('#answer_question_id').attr('value'));
        var token = $( 'meta[name="csrf-token"]' ).attr( 'content' )
        
        $("#loader").removeClass("hidden");
        $("#loader").addClass("show");
         
        $.ajaxSetup( {
            beforeSend: function ( xhr ) {
              xhr.setRequestHeader( 'X-CSRF-Token', token );
            }
        });
         
        $.post("/answers/create.json", {
            token: token,
            delta: this.states,
            question_id: question_id,

        }, function(response) {
            window.location.replace("/questions/" + response.question_id);

        }.bind(this), "JSON");
    }.bind(this));
};
