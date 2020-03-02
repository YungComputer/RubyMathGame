class Player
  attr_accessor :lives

  def initialize
    @lives = 3
  end

  def incorrect
    @lives -= 1
  end

end

