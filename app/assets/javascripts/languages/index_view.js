$(document).ready(function(){
  if(DELTA.is_page("LanguagesController", "index")){
    start_languages         = ['SELECT LANGUAGE', 'Ruby', 'JavaScript', 'Python', 'PHP']
    end_languages           = ['SELECT LANGUAGE', 'Ruby', 'JavaScript', 'Python', 'PHP']
    start_language_selected = 'SELECT LANGUAGE';
    end_language_selected   = 'SELECT LANGUAGE';

    $('#start_language').empty()
    for (var i=0;i<start_languages.length;i++) {
      $('#start_language').append("<option value='" + i + "'>" + start_languages[i] + "</option>")
    }
    $('#end_language').empty()
    for (var i=0;i<end_languages.length;i++) {
      $('#end_language').append("<option value='" + i + "'>" + end_languages[i] + "</option>")
    }

    $('#start_language').on('change', function(){
      start_language_selected = $('#start_language option:selected').text();
      end_languages           = ['SELECT LANGUAGE', 'Ruby', 'JavaScript', 'Python', 'PHP']
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

    $('.go_link').on('click', function(){
      if (start_language_selected === 'SELECT LANGUAGE' || end_language_selected === 'SELECT LANGUAGE') {
        $('#error_messages').html('PLEASE SELECT TWO LANGUAGES')
        return false;
      } else {
        ahref = $(this).find('a');
        ahref.attr('href', "/categories?end_language=" + end_language_selected + "&start_language=" + start_language_selected);   
        start_languages         = ['SELECT LANGUAGE', 'Ruby', 'JavaScript', 'Python', 'PHP']
        end_languages           = ['SELECT LANGUAGE', 'Ruby', 'JavaScript', 'Python', 'PHP']
      }
    });
    
    var hello_world   = "{\"0\":[\"\",\"0\"],\"1\":[\"H\",\"288\"],\"2\":[\"He\",\"511\"],\"3\":[\"Hel\",\"589\"],\"4\":[\"Hell\",\"743\"],\"5\":[\"Hello\",\"895\"],\"6\":[\"Hello \",\"1022\"],\"7\":[\"Hello w\",\"1198\"],\"8\":[\"Hello wo\",\"1326\"],\"9\":[\"Hello wor\",\"1408\"],\"10\":[\"Hello worl\",\"1559\"],\"11\":[\"Hello world\",\"1654\"],\"12\":[\"Hello world!\",\"1969\"],\"13\":[\"Hello world! \",\"2248\"],\"14\":[\"Hello world! W\",\"2655\"],\"15\":[\"Hello world! We\",\"2983\"],\"16\":[\"Hello world! Wel\",\"3126\"],\"17\":[\"Hello world! Welc\",\"3295\"],\"18\":[\"Hello world! Welco\",\"3416\"],\"19\":[\"Hello world! Welcom\",\"3526\"],\"20\":[\"Hello world! Welcome\",\"3646\"],\"21\":[\"Hello world! Welcome \",\"3826\"],\"22\":[\"Hello world! Welcome t\",\"3990\"],\"23\":[\"Hello world! Welcome to\",\"4079\"],\"24\":[\"Hello world! Welcome to \",\"4175\"],\"25\":[\"Hello world! Welcome to D\",\"4400\"],\"26\":[\"Hello world! Welcome to De\",\"4662\"],\"27\":[\"Hello world! Welcome to Del\",\"4944\"],\"28\":[\"Hello world! Welcome to Delt\",\"5087\"],\"29\":[\"Hello world! Welcome to Delta\",\"5223\"],\"30\":[\"Hello world! Welcome to Delta!\",\"5616\"],\"31\":[\"Hello world! Welcome to Delta!\\n\\n\",\"6496\"]}"
    var happy_coding  = "{\"0\":[\"\",\"0\"],\"1\":[\"H\",\"279\"],\"2\":[\"Ha\",\"560\"],\"3\":[\"Hap\",\"640\"],\"4\":[\"Happ\",\"766\"],\"5\":[\"Happy\",\"976\"],\"6\":[\"Happy \",\"1103\"],\"7\":[\"Happy c\",\"1287\"],\"8\":[\"Happy co\",\"1367\"],\"9\":[\"Happy cod\",\"1518\"],\"10\":[\"Happy codi\",\"1638\"],\"11\":[\"Happy codin\",\"1743\"],\"12\":[\"Happy coding\",\"1816\"],\"13\":[\"Happy coding!\",\"2192\"]}"

    var opening_line = new DELTA.Player({
      play_selector: '#hello_world_button',
      view_selector: ".code_example_view"
    });

    closing_line = new DELTA.Player({
      play_selector: '#happy_coding_button',
      view_selector: ".code_example_view2"
    })

    opening_line.play(JSON.parse(hello_world));  
    closing_line.play(JSON.parse(happy_coding))

    $(document).ready(function() {
      $('#hello_world_button').trigger('click');
      
      setTimeout(function() {
        $('#happy_coding_button').trigger('click');
      }, 12000);

      var appendPre = function(time, html) {
        setTimeout(function() {
          $(html).hide().appendTo(".code_example_view").fadeIn(500)
        }, time);
      };

      appendPre(6500, '<span>Do you like to program?</span><br>')
      appendPre(7500, '<span>Does syntax freak you out?</span><br>')
      appendPre(8500, '<span>Do you like to learn by doing?</span><br><br>')
      appendPre(10000, '<span>Get started with Delta by select-<br>ing two languages.</span>')
    });
  };
});
