describe("Player", function() {
  var player;
  var snapshots = [["h",0],["i",3000]];

  beforeEach(function() {
    player = new DELTA.Player({
      play_selector: "#play",
      view_selector: "#view",
    });

    loadFixtures('play_view.html');

  });

  describe('#disable', function(){

    it("should disable the play button", function(){
      player.disable();
      expect($(player.play_selector)).toBeDisabled();
    });

  });

  describe('#enable', function(){

    it("should enable the play button", function(){

      player.disable();
      player.enable();
      expect($(player.play_selector).attr("disabled")).not.toBeDefined();
    
    });

  });

  describe('#update_state', function(){

    it("should update the state property of player", function(){
    
      player.update_snapshots(snapshots);
      expect(player.snapshots).toEqual(snapshots);
    
    });

  });

  describe('#play', function(){
    it("should be able to play back the snapshots", function() {   
      player.play(snapshots);
      expect(player.snapshots).toEqual(snapshots);
    
    });

    describe("when snapshots are playing", function() {
      it("button should be disabled", function() {
     
        player.play(snapshots);
        $(player.play_selector).trigger("click");
         expect($(player.play_selector)).toBeDisabled();
     
      });

    });

  });


});
