$(document).ready(function(){
  if(this_page("LanguagesController", "index")){
    var start_languages         = $('#start_language').text().split("\n");
    var end_languages           = $('#end_language').text().split("\n");
    var start_language_selected = 'SELECT LANGUAGE';
    var end_language_selected   = 'SELECT LANGUAGE';

    $('#start_language').on('change', function(){
      start_language_selected = $('#start_language option:selected').text();
      end_languages           = $('#start_language').text().split("\n");
      $('#end_language').empty();

      end_languages.forEach(function(language) {
        if (start_language_selected === language) {
          match_index = end_languages.indexOf(language);
          end_languages.splice(match_index, 1);
        };
      });

      for (var i=0;i<end_languages.length; i++) {
        $('#end_language')
          .append("<option value='" + i + "'>" + end_languages[i] + "</option>");
      };
    });
    $('#end_language').on('change', function(){
      end_language_selected = $('#end_language option:selected').text();
    });

    // get request to the categories controller

    $('.go_link').on('click', function(){
      if (start_language_selected === 'SELECT LANGUAGE' || end_language_selected === 'SELECT LANGUAGE') {
        // eventually fix this to be more responsive
        $('#error_messages').html("<span>PLEASE SELECT TWO LANGUAGES</span>")
        return false;
      }
      else {
        ahref = $(this).find('a');
        ahref.attr('href', "/categories?end_language=" + end_language_selected + "&start_language=" + start_language_selected);   
      };
    });
    
    delta = "{\"0\":[\"\",\"0\"],\"1\":[\"H\",\"288\"],\"2\":[\"He\",\"511\"],\"3\":[\"Hel\",\"589\"],\"4\":[\"Hell\",\"743\"],\"5\":[\"Hello\",\"895\"],\"6\":[\"Hello \",\"1022\"],\"7\":[\"Hello w\",\"1198\"],\"8\":[\"Hello wo\",\"1326\"],\"9\":[\"Hello wor\",\"1408\"],\"10\":[\"Hello worl\",\"1559\"],\"11\":[\"Hello world\",\"1654\"],\"12\":[\"Hello world!\",\"1969\"],\"13\":[\"Hello world! \",\"2248\"],\"14\":[\"Hello world! W\",\"2655\"],\"15\":[\"Hello world! We\",\"2983\"],\"16\":[\"Hello world! Wel\",\"3126\"],\"17\":[\"Hello world! Welc\",\"3295\"],\"18\":[\"Hello world! Welco\",\"3416\"],\"19\":[\"Hello world! Welcom\",\"3526\"],\"20\":[\"Hello world! Welcome\",\"3646\"],\"21\":[\"Hello world! Welcome \",\"3826\"],\"22\":[\"Hello world! Welcome t\",\"3990\"],\"23\":[\"Hello world! Welcome to\",\"4079\"],\"24\":[\"Hello world! Welcome to \",\"4175\"],\"25\":[\"Hello world! Welcome to D\",\"4400\"],\"26\":[\"Hello world! Welcome to De\",\"4662\"],\"27\":[\"Hello world! Welcome to Del\",\"4944\"],\"28\":[\"Hello world! Welcome to Delt\",\"5087\"],\"29\":[\"Hello world! Welcome to Delta\",\"5223\"],\"30\":[\"Hello world! Welcome to Delta!\",\"5616\"],\"31\":[\"Hello world! Welcome to Delta!\\n\\n\",\"6496\"]}"

    player = new Player({
      play_selector: '#hello_world_button',
      view_selector: ".code_example_view"
    });

    $(document).ready(function() {
      $('#hello_world_button').trigger('click');
    });

    player.play(JSON.parse(delta));  

    setTimeout(function() {
      alert('hello');
    }, 5616);

  };
});