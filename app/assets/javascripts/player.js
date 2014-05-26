
function Player(args) {
    this.play_sel = args.play_sel;
    this.view_sel = args.view_sel;
    this.load_sel = args.load_sel;
};

Player.prototype.play = function(states) {
    $(this.view_sel).html(states[0][0]);
    var view_sel = this.view_sel;

    if (!(states instanceof Array)) {
        states = $.map(states, function(value, index) {
            return [value];
        });
    };


    console.log(states);
    console.log("^--Last state time.");
    $(document).on("click", this.play_sel, function() {
        console.log(states);
        var animation_length_ms = states[states.length-1][1];
        var animation_length_s = Math.ceil(states[states.length-1][1] * 10)/10000;
        if (animation_length_ms === undefined || animation_length_s === undefined){
            console.log(animation_length_ms + " and " + animation_length_s);
            animation_length_ms = 10;
            animation_length_s = .2;
        };


        states.forEach(function(step) {

            setTimeout(function() {

          console.log(view_sel);
                $(view_sel).html(step[0]);
            }, step[1]);

        }.bind(this));
        $(this.play_sel).attr('disabled','disabled');
        console.log(animation_length_ms);
        setTimeout(function() {
            console.log(this.play_sel);
            $(this.play_sel).removeAttr('disabled');
        }.bind(this), animation_length_ms);

        // $(this.load_sel).removeClass();
        // $(this.load_sel).addClass("loading-bar-wait");
        // $(this.load_sel).removeClass("loading-bar-wait");
        // $(this.load_sel).addClass("loading-bar-action");
        // $(this.load_sel).css("transition",""+ animation_length_s + "s")

    }.bind(this));
};
