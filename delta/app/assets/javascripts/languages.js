$(document).ready(function(){
  start_languages = $('#start_language').text().split("\n")
  end_languages   = $('#end_language').text().split("\n")

  $('#start_language').on('change', function(){
    start_language_selected = $('#start_language option:selected').text()
    end_languages   = $('#start_language').text().split("\n")

    end_languages.forEach(function(language) {
      if (start_language_selected === language) {
        match_index = end_languages.indexOf(language)
        end_languages.splice(match_index, 1)
      }
    });

    $('#end_language').empty();

    for (var i=0;i<end_languages.length; i++) {
      $('#end_language')
        .append("<option value='" + i + "'>" + end_languages[i] + "</option>")
    }
    end_languages.forEach(function(language) {

    });

  });
});
