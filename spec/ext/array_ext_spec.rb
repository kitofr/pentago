require 'lib/pentago'

describe "an array" do
  it "should know if it doesn't have 5 in a row of 6" do
    %w{. . . . . .}.has_5_in_a_row?.should be_false
    %w{w w w w . w}.has_5_in_a_row?.should be_false
    %w{w w w . w w}.has_5_in_a_row?.should be_false
    %w{w w . w w w}.has_5_in_a_row?.should be_false
    %w{w . w w w w}.has_5_in_a_row?.should be_false
  end

  [%w{w w w w w .}, 
   %w{. w w w w w}].each do |array|
    it "should know if it does have 5 in a row #{array.inspect}" do
      array.has_5_in_a_row?.should be_true
    end
  end

  [%w{w b w w w w},
   %w{w w b w w w},
   %w{w w w b w w},
   %w{w w w w b w}
  ].each do |array|
    it "should know that it is of same kind #{array.inspect}" do
      array.has_5_in_a_row?.should be_false
    end
   end
end
