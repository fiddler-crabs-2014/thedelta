describe("Recorder", function() {
  var recorder;
  var player;

  beforeEach(function() {

    player = new Player({
      play_sel: "#play",
      view_sel: "#view",
    });

    recorder = new Recorder({
        textarea_sel: "#editor",
        record_sel: "#record",
        view_sel: "#view",
        reset_sel: "#reset",
        save_sel: "#save",
        player: player
    });


    loadFixtures('recorder_view.html');

  });

  describe('#enable_save', function(){

    it("should enable the save button", function(){
      $(recorder.save_sel).attr('disabled','disabled');
      recorder.enable_save();
      expect($(recorder.save_sel)).not.toBeDisabled();
    });

  });

});
