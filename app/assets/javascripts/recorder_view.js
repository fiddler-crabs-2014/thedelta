$( document ).ready(function() {

  var player  = new Player({
      play_selector: "#play",
      view_selector: "#view",
  });

  var recorder = new Recorder({
      textarea_selector: "#recorder textarea",
      record_selector: "#record",
      view_selector: "#view",
      reset_selector: "#reset",
      save_selector: "#save",
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




