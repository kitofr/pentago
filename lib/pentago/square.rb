class Square
	def initialize
		@square = 3.times.collect{ %w{. . .} }
	end
	def place(x,y,who)
		return false unless @square[x][y] == '.'
		@square[x][y] = who
	end
	def rotate!(direction)
		return right_rotate! if direction == :right
		3.times{ right_rotate! }
		#TODO fail if not left?
	end
	def to_s
		@square.collect{|row| row.join }.join "\n"
	end

	private
	def right_rotate!
		tmp = [%w{ 0 0 0 }]
		tmp[1] = [%w{ 0 0 0 }]
		tmp[2] = [%w{ 0 0 0 }]
		tmp[0][0] = @square[2][0]
		tmp[0][1] = @square[1][0]
		tmp[0][2] = @square[0][0]

		tmp[1][0] = @square[2][1]
		tmp[1][1] = @square[1][1]
		tmp[1][2] = @square[0][1]

		tmp[2][0] = @square[2][2]
		tmp[2][1] = @square[1][2]
		tmp[2][2] = @square[0][2]

		@square = tmp
	end
end
