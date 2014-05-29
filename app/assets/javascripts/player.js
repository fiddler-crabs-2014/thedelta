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

DELTA.Player.prototype.add_caret_to_snapshots = function() {
    var snapshots = [];
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
        snapshots.push([this_frame, this_frame_time]);
    };
    return snapshots;
};

DELTA.Player.prototype.reduce_user_pauses_during_playback = function(snapshots) {
    var difference_between_steps = [];

    for(var i = 0; i < snapshots.length-1 ; i++){
        difference_between_steps.push(snapshots[i+1][1] - snapshots[i][1]);
    };

    for(var i = 0; i < snapshots.length ; i++){
        if(difference_between_steps[i] > 2000) {
            difference_between_steps[i] = (Math.random() * 500) + 1500;
        }; 
    };

    for(var i = 0; i < snapshots.length - 1 ; i++){
        snapshots[i+1][1] = difference_between_steps[i] + snapshots[i][1];

        if(i === snapshots.length -1) {
            snapshots[i+1][1] = snapshots[i][1] + 250;
        };
    };

    return snapshots;
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

        var snapshots = this.add_caret_to_snapshots();

        snapshots = this.reduce_user_pauses_during_playback(snapshots);

        snapshots.forEach(function(snapshot){
            setTimeout(function() {
                $(view_selector).html(snapshot[0]);
            }, snapshot[1]);
        });

        this.disable();

        setTimeout(function() {
            this.enable();
        }.bind(this), snapshots[snapshots.length-1][1]);

    }.bind(this));
};

DELTA.Player.prototype.update_snapshots = function(snapshots) {
    this.snapshots = snapshots;
};
