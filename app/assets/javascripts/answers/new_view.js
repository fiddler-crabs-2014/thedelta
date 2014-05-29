$( document ).ready(function() {
  if(DELTA.is_page("AnswersController", "new")){
    var player  = new DELTA.Player({
        play_selector: "#play",
        view_selector: "#view"
    });

    var recorder = new DELTA.RecorderView({
        textarea_selector: "#recorder textarea",
        record_selector: "#record",
        view_selector: "#view",
        reset_selector: "#reset",
        save_selector: "#save",
        player: player
    });

    recorder.init();

    var editor = new DELTA.Editor("#recorder textarea");
    editor.initialize_character_replacement([9,13]);

    $('#play').on('click', function(){
        $('#view').css("background-color", '#f5f5f5');
        $('#view').css("border",'1px solid #ccc');
    });
  };
});
