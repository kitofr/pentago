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

	it "should handle the whole game field when placing balls" do
		game = Game.new
		game.place(1,0,'h')
		game.place(1,1,'e')
		game.place(1,2,'l')
		game.place(1,3,'l')
		game.place(1,4,'o')
		game.to_s.should == %{.h....
.e....
.l....
.l....
.o....
......}
	end

	it "should be possible to rotate first square" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		squares = []
		4.times { squares << Square.new(sq) }
		
		game = Game.create squares
		game.rotate(0, :right)
		game.to_s.should == 
%{741123
852456
963789
123123
456456
789789}
	end

	it "should be possible to rotate second square" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		squares = []
		4.times { squares << Square.new(sq) }
		
		game = Game.create squares
		game.rotate(1, :right)
		game.to_s.should == 
%{123741
456852
789963
123123
456456
789789}
	end

	it "should be possible to rotate third square" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		squares = []
		4.times { squares << Square.new(sq) }
		
		game = Game.create squares
		game.rotate(2, :right)
		game.to_s.should == 
%{123123
456456
789789
741123
852456
963789}
	end

	it "should be possible to rotate fourth square" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		squares = []
		4.times { squares << Square.new(sq) }
		
		game = Game.create squares
		game.rotate(3, :left)
		game.to_s.should == 
%{123123
456456
789789
123369
456258
789147}
	end

	it "should end when 5 balls are in a horizontal row"
	it "should end when 5 balls are in a vertical row"

	it "should have 2 players"
	context "is turn based" do
		it "and starts by the white player placing a ball"
		it "and after white, the black player place a ball"
	end
	#subjects game, square, bit, ball, player
	#verbs rotate, end
end
