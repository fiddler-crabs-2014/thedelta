function Editor(textarea_selector, keys) {

  this.textarea_selector = textarea_selector;
  this.keys = {};

  keys.forEach(function(key){
    var key_number = key[0];
    var key_character = key[1];

    this.keys[key_number] = key_character;
  }.bind(this));

};


Editor.prototype.initialize_event_listener = function(){
  var $textarea_selector = $(this.textarea_selector);

  $textarea_selector.keydown( function( event ) {

    if (this.keys[event.keyCode]) {
        event.preventDefault();

        var substitute = this.keys[event.keyCode];
        var caret_index = $textarea_selector.caret();
        var value = $textarea_selector.val();

        $textarea_selector.val(value.substring(0, caret_index) + substitute + value.substring(caret_index));
        $textarea_selector.caret(caret_index + 1);
    };

  }.bind(this));
};