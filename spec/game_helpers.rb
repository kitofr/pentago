def square
	sq = [[1,2,3]]
	sq[1] = [4,5,6]
	sq[2] = [7,8,9]
	sq
end

def squares
	sqs = []
	4.times { sqs << Square.new(square) }
	sqs
end
