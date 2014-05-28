describe("Recorder", function() {
  var recorder;
  var player;

  beforeEach(function() {

    player = new Player({
      play_selelector: "#play",
      view_selector: "#view",
    });

    recorder = new Recorder({
        textarea_selector: "#editor",
        record_selector: "#record",
        view_selector: "#view",
        reset_selector: "#reset",
        save_selector: "#save",
        player: player
    });


    loadFixtures('recorder_view.html');

  });

  describe('#enable_save', function(){

    it("should enable the save button", function(){
      $(recorder.save_selector).attr('disabled','disabled');
      recorder.enable_save();
      expect($(recorder.save_selector)).not.toBeDisabled();
    });

  });

});
