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
		Square.class_eval{ 
			def initialize
				@square = [%w{1 2 3}]
				@square[1] = %w{4 5 6}
				@square[2] = %w{7 8 9}
			end
		}
		square = Square.new
		square.rotate! :right
		square.to_s.should == %{741
852
963}
	end

	it "should be able to rotate left" do
		Square.class_eval{ 
			def initialize
				@square = [%w{1 2 3}]
				@square[1] = %w{4 5 6}
				@square[2] = %w{7 8 9}
			end
		}
		square = Square.new
		square.rotate! :left
		square.to_s.should == %{369
258
147}

	end
end
