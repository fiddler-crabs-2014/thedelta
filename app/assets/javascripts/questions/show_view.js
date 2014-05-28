  $(document).ready(function(){
    if(this_page("QuestionsController", "show")){
      var questionId = $("h1").attr("id");
      var players = {};

      

      $.get('/get_answers/', { question_id: questionId }, function(response) {
        response.forEach(function(answer){
            players[answer.id] = new Player({
                play_selector: "#play_answer_" + answer.id,
                view_selector: "#preview_answer_" + answer.id
            });
            players[answer.id].play(JSON.parse(answer.delta));
        });  
      });

      var start_language = $('#start_lang').text()
      var end_language   = $('#end_lang').text()
      var category_id    = parseInt($('h1').attr('class'))

      $('#back_to_category').attr('href', '/questions?category='+category_id+'&end_language='+end_language+'&start_language='+start_language)
    };
  });