var DELTA = DELTA || {};

DELTA.Recorder = function() { 
    this.snapshots = [0];
    this.recording = false;
    this.start_time = 0;
    this.time_from_start = 0;
    this.stop_time = 0;

    return this;
};

DELTA.Recorder.prototype.recording_exists = function() {
  return this.snapshots.length > 1;
};

DELTA.Recorder.prototype.start_recording = function(text) {
    if(!this.recording) {
        this.recording = true;
        this.start_time = Date.now();
        
        this.snapshots[this.snapshots.length - 1] = [text, this.stop_time];
    }
};

DELTA.Recorder.prototype.record_snapshot = function(text) {
    if (this.recording) {
        this.time_from_start = Date.now() - this.start_time + this.stop_time;

        text = text.replace(/</g, "&lt;").replace(/>/g, "&gt;");

        this.snapshots.push([text, this.time_from_start]);
        return true;
    };
    return false;
};

DELTA.Recorder.prototype.stop = function() {
    this.recording = false;
    this.stop_time = this.time_from_start;
    this.start_time = Date.now();
    return this.snapshots;
}

DELTA.Recorder.prototype.save = function(question_id, token) {
    return $.ajax({
        url: "/answers/create.json",
        data: {
            token: token,
            delta: this.snapshots,
            question_id: question_id
        }
    });
};

DELTA.Recorder.prototype.reset = function() {
    this.snapshots = [0];
    this.recording = false;
    this.start_time = 0;
    this.time_from_start = 0;
    this.stop_time = 0;
};



