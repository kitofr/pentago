require 'lib/pentago'

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

	it "should be able to rotate right" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		square = Square.new sq
		square.rotate! :right
		square.to_s.should == 
%{741
852
963}
	end

	it "should be able to rotate left" do
		sq = [%w{1 2 3}]
		sq[1] = %w{4 5 6}
		sq[2] = %w{7 8 9}
		square = Square.new sq
		square.rotate! :left
		square.to_s.should == %{369
258
147}
	end
	it "should be able to place balls all over" do
		square = Square.new
		square.place(0,0, '1')
		square.place(0,1, '2')
		square.place(0,2, '3')
		square.place(1,0, '4')
		square.place(1,1, '5')
		square.place(1,2, '6')
		square.place(2,0, '7')
		square.place(2,1, '8')
		square.place(2,2, '9')
		square.to_s.should == %{147
258
369}
	end
end
