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
	it "should end when 5 balls are in a row"
	it "should have 2 players"
	context "is turn based" do
		it "and starts by the white player placing a ball"
		it "and after white, the black player place a ball"
	end
	#subjects game, square, bit, ball, player
	#verbs rotate, end
end
