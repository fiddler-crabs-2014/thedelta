var DELTA = DELTA || {};

DELTA.RecorderView = function(args) {
  this.textarea_selector = args.textarea_selector;
  this.record_selector = args.record_selector;
  this.reset_selector = args.reset_selector;
  this.view_selector = args.view_selector;
  this.save_selector = args.save_selector;

  this.player = args.player;
  this.player.disable();


  this.recorder = new DELTA.Recorder();
};

DELTA.RecorderView.prototype.start = function() {
  this.setup_record();
  this.player.play(this.recorder.snapshots);
}

DELTA.RecorderView.prototype.enable_save = function() {
  $(this.save_selector).removeAttr('disabled');
};

DELTA.RecorderView.prototype.disable_save = function() {
  $(this.save_selector).attr('disabled','disabled');
};

DELTA.RecorderView.prototype.toggle_record_light = function() {
  if($("#record-light").hasClass("record-off")) {
    $("#record-light").removeClass("record-off");
    $("#record-light").addClass("record-on");
  } else {
    $("#record-light").removeClass("record-on");
    $("#record-light").addClass("record-off");
  };
};

DELTA.RecorderView.prototype.setup_record = function() {
  $recorder_selector = $(this.record_selector);
  $recorder_selector.on("click", function() {
    this.toggle_record_light();

    if(!this.recorder.recording) {
      this.player.disable();
      var text = $(this.textarea_selector).val();
      this.recorder.start_recording(text);  
    } else {
      if(this.recorder.recording_exists()) {
        this.player.enable();
        this.enable_save();
      };

      this.recorder.stop();
    };

    this.player.update_snapshots(this.recorder.snapshots);
    $("#answer_delta").caret(0);
  }.bind(this)); 
};    

DELTA.RecorderView.prototype.setup_input = function() {
  $(this.textarea_selector).on("input", function() {
    var text = $(this.textarea_selector).val();

    if(this.recorder.record_snapshot(text)) {
      this.player.update_snapshots(this.recorder.snapshots);
    };
  }.bind(this));
};


DELTA.RecorderView.prototype.setup_reset = function() {
  $(this.reset_selector).on("click", function() {
    this.player.disable();
    this.disable_save();

    $(this.view_selector).empty();
    $(this.textarea_selector).val(this.recorder.snapshots[0][0]);

    this.recorder.reset();
    this.player.update_snapshots(this.recorder.snapshots);
  }.bind(this));
};


DELTA.RecorderView.prototype.setup_save = function() {
  this.disable_save();

  $("form[name=recorder]").submit(function(e) {
    e.preventDefault();

    var question_id = parseInt($('#answer_question_id').attr('value'));
    var user_id = parseInt($('#answer_user_id').attr('value'));

    $("#loader").removeClass("hidden");
    $("#loader").addClass("show");

    this.recorder.save(question_id, user_id).done(function(response) {
      window.location.replace("/questions/" + response.question_id);
    });
  }.bind(this));
};

DELTA.RecorderView.prototype.init = function(){
  this.start();
  this.setup_input();
  this.setup_reset();
  this.setup_save();
};