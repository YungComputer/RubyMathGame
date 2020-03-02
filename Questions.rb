class Questions
  attr_accessor :correct_answer
#  correct_answer will control the lives - 1 if it is false
  def initialize(current_player)
    @first_num = rand(50)
    @second_num = rand(50)
    @answer = @first_num + @second_num
    @current_player = current_player

    puts "#{@current_player.name}: What does #{@first_num} plus #{@second_num} equal to?"
    # ask_question
  end

  def ask_question
    @input_answer = gets.chomp
    if @input_answer == @answer.to_s
      puts "Correct! Great job."
      @correct_answer = true
    else
      puts "Oops! Incorrect answer."
      @correct_answer= false
    end
  end
end