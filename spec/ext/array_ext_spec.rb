require 'lib/pentago'

describe "an array" do
  it "should know if it doesn't have 5 in a row of 6" do
    %w{. . . . . .}.has_5_in_a_row?.should be_false
    %w{w w w w . w}.has_5_in_a_row?.should be_false
    %w{w w w . w w}.has_5_in_a_row?.should be_false
    %w{w w . w w w}.has_5_in_a_row?.should be_false
    %w{w . w w w w}.has_5_in_a_row?.should be_false
  end

  it "should know if it does have 5 in a row" do
    %w{w w w w w .}.has_5_in_a_row?.should be_true
    %w{. w w w w w}.has_5_in_a_row?.should be_true
  end
end
