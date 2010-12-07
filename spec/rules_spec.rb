describe "game rules" do
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

		it "when 5 balls are in a diagonal row"
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
