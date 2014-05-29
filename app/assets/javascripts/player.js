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
        console.log("Playing");
        var animation_length_ms = this.snapshots[this.snapshots.length - 1][1];
        var animation_length_s = Math.ceil(this.snapshots[this.snapshots.length - 1][1] * 10) / 10000;

        if (animation_length_ms === undefined || animation_length_s === undefined) {
            animation_length_ms = 10;
            animation_length_s = 0.2;
        };

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
            new_states.push([this_frame, this_frame_time]);
        };
        
        new_states.forEach(function(state){
            setTimeout(function() {
                $(view_selector).html(state[0]);
            }, state[1]);
        });

        this.disable();

        setTimeout(function() {
            this.enable();
        }.bind(this), animation_length_ms);

    }.bind(this));
};

DELTA.Player.prototype.update_snapshots = function(snapshots) {
    this.snapshots = snapshots;
};
