$(document).ready(function(){
  // dynamically load end language drop down
  start_languages         = $('#start_language').text().split("\n")
  end_languages           = $('#end_language').text().split("\n")
  start_language_selected = 'SELECT LANGUAGE'
  end_language_selected   = 'SELECT LANGUAGE'

  $('#start_language').on('change', function(){
    start_language_selected = $('#start_language option:selected').text()
    end_languages           = $('#start_language').text().split("\n")
    $('#end_language').empty();

    end_languages.forEach(function(language) {
      if (start_language_selected === language) {
        match_index = end_languages.indexOf(language)
        end_languages.splice(match_index, 1)
      }
    });

    for (var i=0;i<end_languages.length; i++) {
      $('#end_language')
        .append("<option value='" + i + "'>" + end_languages[i] + "</option>")
    }
  });
  $('#end_language').on('change', function(){
    end_language_selected = $('#end_language option:selected').text()
  });

  // get request to the categories controller

  $('.go_link').on('click', function(){
    if (start_language_selected === 'SELECT LANGUAGE' || end_language_selected === 'SELECT LANGUAGE') {
      // eventually fix this to be more responsive
      alert('Please select two programming languages');
      return false;
    }
    else {
      ahref = $(this).find('a')
      ahref.attr('href', "/categories?end_language=" + end_language_selected + "&start_language=" + start_language_selected)    }
  });
});
