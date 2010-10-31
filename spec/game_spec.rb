require 'lib/pentago'

describe "a pentago game" do
	it "should consist of game field with 4 squares and 3x3 bit" do
		game = Game.new
		game.to_s.should == %{......
......
......
......
......
......}
	end

	it "should not rotate game field when printing" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		square = Square.new sq
		
		Square.stub(:new).and_return(square)

		game = Game.new
		game.to_s.should == %{123123
456456
789789
123123
456456
789789}
	end	

	it "should be able to locate different squares" do
		game = Game.new
		game.find_square(0,0).should be 0
		game.find_square(3,0).should be 1
		game.find_square(0,3).should be 2
		game.find_square(3,3).should be 3
	end

	it "should end when 5 balls are in a row" do
		game = Game.new
		game.place(1,0,'w')
		game.place(1,1,'w')
		game.place(1,2,'w')
		game.place(1,3,'w')
		game.place(1,4,'w')
		game.ended?.should be true
		game.to_s.should == %{.w....
.w....
.w....
.w....
.w....
......}
	end
	it "should have 2 players"
	context "is turn based" do
		it "and starts by the white player placing a ball"
		it "and after white, the black player place a ball"
	end
	#subjects game, square, bit, ball, player
	#verbs rotate, end
end
