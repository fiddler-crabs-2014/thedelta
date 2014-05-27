describe("Player", function() {
  var player;
  var states = [["h",0],["i",3000]]

  beforeEach(function() {
    player = new Player({
      play_sel: "#play",
      view_sel: "#view",
    });
  });

  describe('#play', function(){
    it("should be able to play back the states", function() {
      player.play(states);
      expect(player.states).toEqual(states);
    });
    describe("when states are playing", function() {
      beforeEach(function() {
        loadFixtures('play_view.html');
      });

      it("button should be disabled", function() {
        player.play(states);
        $(player.play_sel).trigger("click");
         expect($(player.play_sel)).toBeDisabled();
      });
    });
  });

  it("disable_btn should disable the play button", function() {
    player.disable_btn(states);
    expect($(player.play_sel)).toBeDisabled();
  });


});
