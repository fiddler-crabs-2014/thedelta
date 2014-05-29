describe("RecorderView", function() {
  var recorder_view;
  var player;

  beforeEach(function() {
    player = new DELTA.Player({
      play_selelector: "#play",
      view_selector: "#view",
    });

    recorder_view = new DELTA.RecorderView({
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
      $(recorder_view.save_selector).attr('disabled','disabled');
      recorder_view.enable_save();
      expect($(recorder_view.save_selector)).not.toBeDisabled();
    });

  });

});
