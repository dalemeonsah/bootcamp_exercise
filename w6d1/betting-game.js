$(document).ready(function() {
  var bankroll = 100;
  $('#game-bet').on('click', function(){
    bet = +($('#bet').val());
    guess = +($('#guess').val());

    if (bet > 4 && bet < 11 && guess > 0 && guess < 11){
      if (bankroll > 0){
        var random_num = Math.floor((Math.random() * 10) + 1);
        // play game until bankroll is less than 1
        if (guess == random_num){
          bankroll += bet;
          $('#balance').text("Correct guess! Your balance is $" + bankroll);
        }
        else if(Math.abs(guess - random_num) == 1){
          $('#balance').text("Urgh almost! Your balance is $" + bankroll);
        }
        else{
          bankroll -= bet;
          $('#balance').text("Blah! Your balance is $" + bankroll);
        }
      }
      else {
        $('#balance').text("You lose! Your balance is $" + bankroll);
      }
    }
    else{
     $('#balance').text("Please make correct input"); 
    }
  });
});
