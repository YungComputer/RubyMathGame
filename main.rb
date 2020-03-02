require './Player.rb'
require './Questions.rb'

class Game
  attr_accessor :turn
  def initialize
    @current_player = 'Player 1' 
    # first current player starts at Player 1, then goes back and forth
    @first_player = Player.new
    @second_player = Player.new

    @first_player_lives = "#{@first_player.lives} / 3"
    @second_player_lives = "#{@second_player.lives} / 3"
    # displays the lives as 3 / 3 and then decreases if correct_answer is false
    @game_over = false 
    #by default, the game is not over, and will be set true when a player hits 0/3 lives.
    #until game_over is true, keep calling turns.
    until @game_over == true
      self.turn
    end
  end

  def turn
    puts "----- NEW TURN -----"
    question = Questions.new(@current_player)
    question.ask_question
    #if answer is wrong, delete 1 life
    if !ask_question.correct_answer
      incorrect
    end
  end

  def alternate_player
    if @current_player == 'Player 1'
      @current_player = 'Player 2'
    else 
      @current_player = 'Player 1'
    end
    puts "P1: #{@first_player_lives} vs P2: #{@second_player_lives}"
  end

  def lives_left
    if @current_player == 'Player 1'
      if @first_player_lives == 0
        puts "Player 2 wins with a score of #{@second_player_lives} / 3"
        @game_over = true
        puts "----- GAME OVER -----"
        puts "Good bye!"
      elsif @second_player_lives == 0
        puts "Player 1 wins with a score of #{@first_player_lives} / 3"
        @game_over = true
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end
    end
  end
end

start_game = Game.new