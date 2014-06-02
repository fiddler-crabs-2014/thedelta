  $(document).ready(function(){
    if(DELTA.is_page("AnswersController", "show")){
      $(document).ready(function(){
        var start = JSON.parse($('.show_delta').text())[0][0];
        var delta = JSON.parse($('.show_delta').text());
        var end = JSON.parse($('.show_delta').text())[Object.keys(delta).length-1][0];

        $('.do_vote').click(function(e){
          e.preventDefault();
          var data = $(this).parent().serialize();


          $.post('/vote.json', data)
          .success(function(response){

            $(response.id).html(response.text);

          });

        });

        $('.show_original').html(start)
        $('.show_final').html(end)

        var player = new DELTA.Player({
          play_selector: "#play_answer",
          view_selector: "#preview_answer"
        });

        player.play(delta);

      });
    };
  });
