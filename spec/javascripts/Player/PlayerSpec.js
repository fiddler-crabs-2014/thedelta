describe("Player", function() {
  var player;
  var states = [["h",0],["i",3000]];

  beforeEach(function() {

    player = new Player({
      play_sel: "#play",
      view_sel: "#view",
    });

    loadFixtures('play_view.html');

  });

  describe('#disable', function(){

    it("should disable the play button", function(){
      player.disable();
      expect($(player.play_sel)).toBeDisabled();
    });

  });

  describe('#enable_btn', function(){

    it("should enable the play button", function(){

      player.disable();
      player.enable_btn();
      expect($(player.play_sel).attr("disabled")).not.toBeDefined();
    
    });

  });

  describe('#update_state', function(){

    it("should update the state property of player", function(){
    
      player.update_state(states);
      expect(player.states).toEqual(states);
    
    });

  });

  describe('#play', function(){

    it("should be able to play back the states", function() {
    
      player.play(states);
      expect(player.states).toEqual(states);
    
    });

    describe("when states are playing", function() {

      it("button should be disabled", function() {
     
        player.play(states);
        $(player.play_sel).trigger("click");
         expect($(player.play_sel)).toBeDisabled();
     
      });

    });

  });


});
