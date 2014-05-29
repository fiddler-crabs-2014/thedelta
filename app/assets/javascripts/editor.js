var DELTA = DELTA || {};
DELTA.Editor = function(textarea_selector) {
  this.textarea_selector = textarea_selector;
};


DELTA.Editor.prototype.initialize_character_replacement = function(keys_to_replace){
  this.character_replacement_data = { 9: "\t", 
                                     13: "\n" };
  var $textarea_selector = $(this.textarea_selector);
  var keys = {};

  keys_to_replace.forEach(function(key_number){
    keys[key_number] = this.character_replacement_data[key_number];
  }.bind(this));

  $textarea_selector.keydown( function( event ) {
    if (keys[event.keyCode]) {
        event.preventDefault();

        var substitute = keys[event.keyCode];
        var caret_index = $textarea_selector.caret();
        var value = $textarea_selector.val();

        $textarea_selector.val(value.substring(0, caret_index) + substitute + value.substring(caret_index));
        $textarea_selector.caret(caret_index + 1);
    };
  }.bind(this));
};