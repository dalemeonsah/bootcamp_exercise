require 'pry'
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
  puts "Welcome to game of two! Player 1 will go first!"
  flag = false
  begin
    puts "#{@player_life_score[@turn][:name]} turn"
    
    random_question_generator
    
    answer = gets.chomp.to_i
    puts ""
    
    verify_answer(answer)
    i_lost(@player_life_score[@turn])
    flag = is_alive?(@player_life_score[@turn])
    @turn = (@turn + 1) % 2
  end while !flag
end

def random_question_generator
  random_num = Random.new
  random_num = random_num.rand(1..20)
  puts "What does #{random_num} + #{random_num} equal to?"
  random_array = [random_num, random_num, random_num + random_num]
  @correct_answer = random_array[2]
end

def verify_answer(answer)
  if @correct_answer == answer
      @player_life_score[@turn][:score] += 1
  else
    @player_life_score[@turn][:life] -= 1
    puts "#{@player_life_score[@turn][:name]} got wrong answer"
    puts "#{@player_life_score[0][:name]} score now is #{@player_life_score[0][:score]} !"
    puts "#{@player_life_score[1][:name]} score now is #{@player_life_score[1][:score]} !"
    puts "---------------------------------------------------"
    puts ""
  end
end

def is_alive?(player)
  player[:life] == 0 ? true : false
end

def i_lost(player)
  if player[:life] == 0 
    puts "#{player[:name]} lost!" 
  else
    puts "Lets' go! Continue!"
  end
end
#puts random_question_generator
game_of_two