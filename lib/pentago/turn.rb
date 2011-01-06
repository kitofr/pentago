class Turn
  def initialize(game, player)
    @game, @player = game, player
    @done = false
  end
  def place(x,y)
    @x,@y = x,y
    self
  end
  def rotate(square, direction)
    @square, @direction = square, direction
    self
  end
  def execute!
    @game.place(@x,@y, @player)
    @game.rotate(@square, @direction)
    @done = true
  end
  def is_done?
    @done
  end
end
