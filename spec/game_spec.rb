require 'spec_helper'
require 'game_helpers'

describe "a pentago game" do
	it "should consist of game field with 4 squares and 3x3 bit" do
		game = Game.new
		game.to_s.should == %{
......
......
......
......
......
......}.strip
	end

	#TODO should probably use shared_examples_for
	it "should not rotate game field when printing" do
		sq = Square.new square
		Square.stub(:new).and_return(sq)

		game = Game.new
		game.to_s.should == %{
123123
456456
789789
123123
456456
789789}.strip
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
		game.place(4,5,'!')
		game.to_s.should == %{
.h....
.e....
.l....
.l....
.o....
....!.}.strip
	end

  context 'rotations' do
	  it "should be possible to rotate first square" do
		  game = Game.create squares
		  game.rotate(0, :right)
		  game.to_s.should == %{
741123
852456
963789
123123
456456
789789}.strip
	  end

	  it "should be possible to rotate second square" do
		  game = Game.create squares
		  game.rotate(1, :right)
		  game.to_s.should == %{
123741
456852
789963
123123
456456
789789}.strip
	  end

	  it "should be possible to rotate third square" do
		  game = Game.create squares
		  game.rotate(2, :right)
		  game.to_s.should == %{
123123
456456
789789
741123
852456
963789}.strip
    end

	  it "should be possible to rotate fourth square" do
	  	game = Game.create squares
	  	game.rotate(3, :left)
	  	game.to_s.should == %{
123123
456456
789789
123369
456258
789147}.strip
	  end
  end

	context "is turn based" do
    it "should be a draw if both players has 5 balls in a row after a completed turn"
    it "can end prematurely if the player places a ball in such way that it completes the game (without a turn)"
		it "should have 2 players"
		it "and starts by the white player placing a ball"
		it "and after white, the black player place a ball"
	end
end

describe "a player" do
	it "has 18 balls to place"
	it "is either white or black"
end

