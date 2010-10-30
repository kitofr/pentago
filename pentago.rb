require 'rubygems'
require 'spec'

describe "a pentago game" do
	it "should consist of game field with 4 squares and 3x3 bit"
	it "should be possible to rotate a square left"
	it "should be possible to rotate a square right"
	it "should end when 5 balls are in a row"
	it "should have 2 players"
	context "is turn based" do
		it "and starts by the white player placing a ball"
		it "and after white, the black player place a ball"
	end
	#subjects game, square, bit, ball, player
	#verbs rotate, end
end

describe "a square" do
	it "should consist of 3x3 bits" do
		square = Square.new
		square.to_s.should == %{...
...
...}
	end

	it "should be able to hold a white ball" do
		square = Square.new
		square.place(1,1, 'w')
		square.to_s.should == %{...
.w.
...}
	end
	it "should not be possible to place a ball on top of another ball" do
		#TODO think i want to raise exceptions here...
		square = Square.new
		square.place(1,1,'w')
		square.place(1,1,'b').should be false
		square.to_s.should == %{...
.w.
...}
	end
	it "should be able to rotate left"
	it "should be able to rotate right"
end

class NotAllowedError < RuntimeError
end


class Square
	def initialize
		@square = 3.times.collect{ %w{. . .} }
	end
	def place(x,y,who)
		return false unless @square[x][y] == '.'
		@square[x][y] = who
	end
	def to_s
		@square.collect{|row| row.join }.join "\n"
	end
end
