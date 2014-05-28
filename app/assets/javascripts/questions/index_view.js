  $(document).ready(function(){
    if(this_page("QuestionsController", "index")){
      var questions = $('.question_index');
      var question_id_array = [];
      var players = {};

      for (var i=0;i<questions.length;i++) {
        question_link = $(questions[i]).find('a').attr('href');
        question_id   = question_link.match(/\d+/).join("");
        question_id_array.push(question_id);
      };

      question_id_array.forEach(function(questionId) {
   
        $.get('get_answer/', {question_id: questionId}, function(response) {
   
              players[questionId] = new Player({
                  play_selector: "#Play_Question_"+questionId,
                  view_selector: "#Preview_Question_"+questionId
              });

              players[questionId].play(response);
        });
      });

      var start_language = $('#start_lang').text()
      var end_language   = $('#end_lang').text()
      var category_id    = parseInt($('h1').attr('class'))

      $('#back_to_category').attr('href', '/categories?end_language='+end_language+'&start_language='+start_language)
    };
  });
