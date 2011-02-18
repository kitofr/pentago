require 'spec_helper'

describe "game rules" do
  include Rules

  context "turn field left" do
    it "should look like the field just did, only tilted to the left one step" do
		  game = Game.create turn_field_left(squares)
      game.to_s.should == %{
369369
258258
147147
369369
258258
147147}.strip
    end
  end
  
  context "zip squares" do
    it "should hold a sequence of squares in a specified order"
  end

  context "has 5 in a row" do
    it "should determine if a sequence of squares has 5 in a row"
  end

  context "game ended" do
  end

  context "when finished" do
    (0..5).each do |row|
      [[0,1,2,3,4],[1,2,3,4,5]].each do |columns|
        it "could have 5 balls lined up like (#{columns.inspect}) on row: #{row}" do
          game = Game.new
          columns.each do |column| 
            game.finished?.should be_false
            game.place(column,row,'w') 
          end
          game.finished?.should be_true
        end

				it "could have 5 balls in a vertical (#{columns.inspect}) column: #{row}" do
					game = Game.new
					columns.each do |column| 
						game.finished?.should be_false
						game.place(row, column, 'w') 
					end
					game.finished?.should be_true
				end
			end
		end

		it "when 5 balls are in a diagonal row" do
      pending do
        game = Game.new
        game.place(0,0, 'w')
        game.place(1,1, 'w')
        game.place(2,2, 'w')
        game.place(3,3, 'w')
        game.finished?.should be_false
        game.place(4,4, 'w')
        game.finished?.should be_true
      end
    end
  end
  context "when still on" do
    it "has no 5 balls adjacent" do
      game = Game.new
      [0,1,2,3,5].each do |column|
        game.place(column, 0, 'w')
      end
      game.finished?.should be_false
    end
  end

end
