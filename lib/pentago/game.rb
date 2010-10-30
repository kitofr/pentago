class Game
	def initialize
		@squares = []
		4.times {
			@squares << Square.new
		}
		tmp  = [@squares[0].zip(@squares[1])]
		tmp[1] = @squares[2].zip(@squares[3])
		@squares = tmp

	end
	def ended?
		true
	end
	def place(x,y,who)
		raise "todo"
	end
	def to_s
		@squares.collect{|square| square.collect{|row| row.join}.join "\n" }.join "\n"
	end
end
