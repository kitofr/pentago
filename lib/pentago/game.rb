class Game
	def initialize
		@squares = []
		4.times {
			@squares << Square.new
		}
	end
	def to_s
		tmp = [@squares[0].zip(@squares[1])]
		tmp[1] = @squares[2].zip(@squares[3])
		
		tmp.collect{|square| square.collect{|row| row.join}.join "\n" }.join "\n"
	end
end
