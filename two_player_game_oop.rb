require 'pry'
require 'colorize'
#binding.pry
class Player

  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  # def change_player
  #   if @curentPlayer == @players.size - 1
  #     @curentPlayer = 0
  #   else
  #     @curentPlayer += 1
  #   end
  # end

  def is_alive?
    @lives == 0 ? true : false
  end

  # def lost
  #   @lives == 0 ? "#{@name} lost!" : "Continue! Go go go!"
  # end
end

@turn = 0

def game_oop
  puts "Welcome to game of two!"
  puts "Player 1 please enter your name"
  player_name_1 = gets.chomp
  player_1 = Player.new(player_name_1)

  puts "Player 2 please enter your name"
  player_name_2 = gets.chomp
  player_2 = Player.new(player_name_2)
  
  players = [player_1, player_2]
  continue_boolean = false
  begin
    # loop of the game
    lose = false
    begin
      puts "#{players[@turn].name} turn"
      random_question_generator
      answer = gets.chomp.to_i
      #binding.pry
      puts ""
        
      verify_answer(answer, players[@turn])
      lose = players[@turn].is_alive?
      puts "Player #{players[@turn].name} lost the game" if players[@turn].is_alive?
      @turn = (@turn + 1) % 2
    end while !lose

    #loop to continue
    puts "Continue?(yes/no)"
    continue = gets.chomp
    if continue == 'no'
      puts "See you!"
      continue_boolean = true
    elsif continue == 'yes'
      players[0].lives = 3
      players[1].lives = 3
      @turn = 0
    end
  end while !continue_boolean
end

def random_question_generator
  random_num_1 = rand(1..5)
  random_num_2 = rand(1..5)
  random_operator = [:+, :-, :*, :/]
  get_operator = random_operator.sample
  result = random_num_1.send(get_operator, random_num_2)
  puts "What does #{random_num_1} #{get_operator} #{random_num_2} equal to?"
  random_array = [random_num_1, random_num_2, result]
  @correct_answer = random_array[2]
end

def verify_answer(answer, player)
  if @correct_answer == answer
    player.score += 1
    puts "#{player.name} got correct answer".green
    puts "#{player.name}\'s score now is #{player.score}!"
    puts ""
  else
    player.lives -= 1
    puts "#{player.name} got wrong answer".red
    puts "#{player.name}\'s score now is #{player.score}!"
    puts "---------------------------------------------------"
    puts ""
  end
end

game_oop