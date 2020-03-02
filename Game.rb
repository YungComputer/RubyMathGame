require './Player.rb'
require './Questions.rb'

class Game

  def initialize
    # first current player starts at Player 1, then goes back and forth
    @first_player = Player.new 'Player 1'
    @current_player = @first_player 
    @second_player = Player.new 'Player 2'
    turn
  end

  def turn
    puts "----- NEW TURN -----"
    question = Questions.new(@current_player)
    question.ask_question

    if !question.correct_answer
      @current_player.incorrect
    end
    if @current_player.lives > 0
      toggle_player
      puts "P1: #{@first_player.lives}/3 vs P2: #{@second_player.lives}/3"
      turn
    else
      end_game
    end
    
  end

  def toggle_player
    if @current_player == @first_player
      @current_player = @second_player

    else @current_player == @second_player
      @current_player = @first_player
    end
  end

  def end_game
      if @current_player.lives == 0
        puts "Sorry #{@current_player.name}, you lost!"
        puts "----- GAME OVER -----"
        puts "Good bye!"
    end
  end
end

