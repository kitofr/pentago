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
  def finished?
    tmp  = [@squares[0].zip(@squares[1])]
		tmp[1] = @squares[2].zip(@squares[3])
    
		#TODO this should surely be done differently :)
    horizontal = tmp.flatten
    6.times do |i|
      x = horizontal.take(6)
      return true if x.has_5_in_a_row?
      horizontal.shift(6)
    end
		
		skip_6 = lambda { |array, i|
			@i = @i.nil? ? i : @i + 6 
			@i = i if @i >= array.length
			array[@i]
		}
		
		game = tmp.flatten
		6.times do 
			y = []
			6.times do |i|
				y << skip_6.call( game, i)
			end
			game.shift(1)
			return true if y.has_5_in_a_row?
		end

    false
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
