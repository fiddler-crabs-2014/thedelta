  $(document).ready(function(){
    if(this_page("AnswersController", "show")){
      $(document).ready(function(){
        start = JSON.parse($('.show_delta').text())[0][0];
        delta = JSON.parse($('.show_delta').text());
        end   = JSON.parse($('.show_delta').text())[Object.keys(delta).length-1][0];

        $('.do_vote').click(function(e){
          e.preventDefault();
          var data = $(this).parent().serialize();

          console.log("vote clicked: " + data);

          $.post('/vote.json', data)
          .success(function(response){

            console.log("AJAX success" + response.text);
            $(response.id).html(response.text);

          });

        });

        $('.show_original').html(start)
        $('.show_final').html(end)

        player = new Player({
          play_selector: "#play_answer",
          view_selector: "#preview_answer"
        });

        player.play(delta);

      });
    };
  });
