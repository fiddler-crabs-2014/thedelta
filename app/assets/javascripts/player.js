var DELTA = DELTA || {};

DELTA.Player = function(args) {
    this.play_selector = args.play_selector;
    this.view_selector = args.view_selector;
    this.snapshots = [0];
};

DELTA.Player.prototype.disable = function() {
    $(this.play_selector).attr('disabled', 'disabled');
};

DELTA.Player.prototype.enable = function() {
    $(this.play_selector).removeAttr('disabled');
};

DELTA.Player.prototype.play = function(snapshots) {
    this.snapshots = snapshots;
    $(this.view_selector).html(this.snapshots[0][0]);
    var view_selector = this.view_selector;

    if (!(this.snapshots instanceof Array)) {
        this.snapshots = $.map(this.snapshots, function(value, index) {
            return [value];
        });
    };

    $(document).on("click", this.play_selector, function() {

        var new_states = [];
        var this_frame;
        var this_frame_time;
        var position;

        for (var i = 0; i < this.snapshots.length; i++) {
            this_frame = this.snapshots[i][0];
            this_frame_time = this.snapshots[i][1];

            if (i < this.snapshots.length-1) {
                var next_frame = this.snapshots[i + 1][0];

                for (var x = 0; x <= this_frame.length; x++) {
                    if (!(this_frame[x] === next_frame[x])) {
                        position = x;
                        break;
                    };
                };
                if (this_frame.length === position){
                    this_frame = this_frame + " ";
                };
                if (this_frame.substr(position, 1) === "\n"){
                    this_frame = this_frame.substr(0, position) + " " + this_frame.substr(position);
                };
                this_frame = this_frame.substr(0, position) + "<span class='cursor'>" + this_frame.substr(position, 1)+'</span>'+this_frame.substr(position + 1);
            };
            this_frame_time = parseInt(this_frame_time);

            new_states.push([this_frame, this_frame_time]);
        };
        var difference_between_steps = [];

        for(var i = 0; i < new_states.length-1 ; i++){
            difference_between_steps.push(new_states[i+1][1] - new_states[i][1]);
        };

        for(var i = 0; i < new_states.length ; i++){
            if(difference_between_steps[i] > 2000) {
                difference_between_steps[i] = (Math.random() * 500) + 1500;
            }; 
        };

        for(var i = 0; i < new_states.length - 1 ; i++){
            new_states[i+1][1] = difference_between_steps[i] + new_states[i][1];

            if(i === new_states.length -1) {
                new_states[i+1][1] = new_states[i][1] + 250;
            };
        };



        
        new_states.forEach(function(state){
            setTimeout(function() {
                $(view_selector).html(state[0]);
            }, state[1]);
        });

        this.disable();

        setTimeout(function() {
            this.enable();
        }.bind(this), new_states[new_states.length-1][1]);

    }.bind(this));
};

DELTA.Player.prototype.update_snapshots = function(snapshots) {
    this.snapshots = snapshots;
};
