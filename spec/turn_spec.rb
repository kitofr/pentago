require 'spec_helper'

describe "a turn" do
  it "is defined by a ball placement follwed by a rotation" do
    game = Game.new
    turn = Turn.new(game, :w).place(0,0).rotate(0,:right)
    turn.execute!
    game.to_s.should == %{..w...
......
......
......
......
......}
  end

  it "is not 'done' until after it is executed" do
    game = Game.new
    turn = Turn.new(game, :b)
    turn.is_done?.should be_false

    turn.place(0,0)
    turn.is_done?.should be_false
    
    turn.rotate(0,:right)
    turn.is_done?.should be_false

    turn.execute!
    turn.is_done?.should be_true
  end

  it "should place the ball before it rotates a square" do
    game = double()
    game.should_receive(:place).with(0,0,:w).ordered
    game.should_receive(:rotate).with(0,:right).ordered

    turn = Turn.new(game, :w).place(0,0).rotate(0,:right)
    turn.execute!
 end 
end
