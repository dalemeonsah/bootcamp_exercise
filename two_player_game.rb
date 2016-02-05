require 'pry'
require 'colorize'

#binding.pry
@player_life_score = [
  {
    :name => "Player 1",
    :id => 0,
    :life => 3,
    :score => 0
  },
  {
    :name => "Player 2",
    :id => 1,
    :life => 3,
    :score => 0
  }
]
@correct_answer = 0
@turn = 0

def game_of_two
  puts "Welcome to game of two!"
  puts "Player 1 please enter your name"
  player_name_1 = gets.chomp
  @player_life_score[0][:name] = player_name_1
  puts "Player 2 please enter your name"
  player_name_2 = gets.chomp
  @player_life_score[1][:name] = player_name_2

  flag = false
  begin
    puts "#{@player_life_score[@turn][:name]} turn"
    
    random_question_generator
    input = gets.chomp
    answer = input.to_i
    #binding.pry
    puts ""
      
    verify_answer(answer.to_i)
    i_lost(@player_life_score[@turn])
    flag = is_not_alive?(@player_life_score[@turn])

    @turn = (@turn + 1) % 2
  end while !flag
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

def verify_answer(answer)
  if @correct_answer == answer
    @player_life_score[@turn][:score] += 1
    puts "Correct Answer!".green
    puts ""
  else
    @player_life_score[@turn][:life] -= 1
    puts "#{@player_life_score[@turn][:name]} got wrong answer".red
    puts "#{@player_life_score[0][:name]}\'s score now is #{@player_life_score[0][:score]} !"
    puts "#{@player_life_score[1][:name]}\'s score now is #{@player_life_score[1][:score]} !"
    puts "---------------------------------------------------"
    puts ""
  end
end

def is_not_alive?(player)
   player[:life] == 0 ? true : false
end

def i_lost(player)
  if player[:life] == 0 
    puts "#{player[:name]} lost!"
    puts "Do you want to continue? (yes/no otherwise quit program)"
    input = gets.chomp
    flag = false
    begin
      case input
      when 'yes'
        @player_life_score[0][:life] = 3
        @player_life_score[1][:life] = 3
        @turn = 0
        puts "Lets' play again"
        flag = true
      when 'no'
        puts "See you later!"
        flag = true
      else
        puts "Command Error"
        flag = true
      end
    end while !flag
  else
    puts "Lets' go! Continue!"
  end
end
#puts random_question_generator
game_of_two