function Player(args) {
    this.play_sel = args.play_sel;
    this.view_sel = args.view_sel;
    this.load_sel = args.load_sel;
    this.states = [0];
};

Player.prototype.disable_btn = function() {
    $(this.play_sel).attr('disabled', 'disabled');
};

Player.prototype.enable_btn = function() {
    $(this.play_sel).removeAttr('disabled');
};

Player.prototype.play = function(states) {
    this.states = states;
    $(this.view_sel).html(this.states[0][0]);
    var view_sel = this.view_sel;

    if (!(this.states instanceof Array)) {
        this.states = $.map(this.states, function(value, index) {
            return [value];
        });
    };


    $(document).on("click", this.play_sel, function() {

        var animation_length_ms = this.states[this.states.length - 1][1];
        var animation_length_s = Math.ceil(this.states[this.states.length - 1][1] * 10) / 10000;

        if (animation_length_ms === undefined || animation_length_s === undefined) {

            animation_length_ms = 10;
            animation_length_s = 0.2;

        };

        var new_states = [];
        var this_frame;
        var frame_time;
        var position;

        for (var i = 0; i < this.states.length; i++) {
            this_frame = this.states[i][0];
            frame_time = this.states[i][1];
       
            if (i < this.states.length-1) {
                var next_frame = this.states[i + 1][0];
     
                for (var x = 0; x <= this_frame.length; x++) {

                    if (!(this_frame[x] === next_frame[x])) {
                        position = x;
                        break;
                    };

                };
            
                if (this_frame.length === position){
                    this_frame = this_frame + " ";
                };
        
                this_frame = this_frame.substr(0, position) + "<span class='cursor'>" + this_frame.substr(position, 1)+'</span>'+this_frame.substr(position + 1);
            };
           
            new_states.push([this_frame, frame_time]);
        };
        
        new_states.forEach(function(state){
            setTimeout(function() {
                $(view_sel).html(state[0]);
            }, state[1]);
        });


        this.disable_btn();

        setTimeout(function() {
            this.enable_btn();
        }.bind(this), animation_length_ms);

    }.bind(this));
};

Player.prototype.update_state = function(states) {
    this.states = states;
};
