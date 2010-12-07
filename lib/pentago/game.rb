class Game
	def self.create(squares)
		game = Game.new
		game.squares = squares
		game
	end
	def initialize
		@squares = []
		4.times {	@squares << Square.new	}
	end
	def find_square(x,y)
		return square = x < 3 ? 0 : 1 if y < 3
		square = x < 3 ? 2 : 3
	end
	def place(x,y,who)
		square = find_square(x,y)
		@squares[square].place(x%3,y%3, who)
	end
	def rotate(square, direction)
		sq = @squares[square]
		sq.rotate! direction
	end

  include Rules
  def finished?
    game_ended?(@squares)
  end
	def to_s
		tmp  = [@squares[0].zip(@squares[1])]
		tmp[1] = @squares[2].zip(@squares[3])
		tmp.collect{|square| square.collect{|row| row.join}.join "\n" }.join "\n"
	end
	def squares=(squares)
		@squares = squares
	end
end
