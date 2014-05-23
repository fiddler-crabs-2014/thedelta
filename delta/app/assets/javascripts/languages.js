$(document).ready(function(){
  // dynamically load end language drop down
  start_languages = $('#start_language').text().split("\n")
  end_languages   = $('#end_language').text().split("\n")

  $('#start_language').on('change', function(){
    start_language_selected = $('#start_language option:selected').text()
    end_languages           = $('#start_language').text().split("\n")

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
  });
  $('#end_language').on('change', function(){
    end_language_selected = $('#end_language option:selected').text()
  });

  // $('#start_language').on('click', function(event) {
  //   return false;
  // })

  // get request to the categories controller

  // $('a').on('click', function(){
  //   console.log(start_language_selected)
  //   console.log(end_language_selected)
  //   $.get('categories/show', {languages: {start_language: start_language_selected, end_language: end_language_selected}})
  // });
});
