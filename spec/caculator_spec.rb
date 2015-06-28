require_relative 'spec_helper'

describe Caculator do
  before :each do
    @c = Caculator.new
  end

  context "caculator with integer" do

    it "should work with just integer" do
      input = "1"
      expect(@c[input]).to eql 1
    end
    it "should work with plus" do
      input = "1 + 2"
      expect(@c[input]).to eql 3
    end

    it "should work with minus" do
      input = "1 - 2"
      expect(@c[input]).to eql -1
    end

    it "should work with times" do
      input = "1 * 2"
      expect(@c[input]).to eql 2
    end

    it "should work with divide" do
      input = "1 / 2"
     expect(@c[input]).to eql 0
   end
  end

  context "calculator with float" do
    it "should work with plus" do
      input = "1 + 2.0"
      expect(@c[input]).to eql 3.0
    end

    it "should work with minus" do
      input = "1 - 2.0"
      expect(@c[input]).to eql -1.0
    end

    it "should work with times" do
      input = "1 * 2.0"
      expect(@c[input]).to eql 2.0
    end

    it "should work with divide" do
      input = "1 / 2.0"
     expect(@c[input]).to eql 0.5
   end
  end

  context "caculator with ()" do
     it "should work when not begin with ()" do
        input = "1 + (2 + 3)"
        expect(@c[input]).to eql 6
      end
      it "should work when begin with ()" do
        input = "(1 + 2)"
        expect(@c[input]).to eql 3
      end

      it "should work when multiple ()" do
        input = " (1 + (2 + 3))"
        expect(@c[input]).to eql 6
      end

      it "should work when (num)" do
        input = "(1)"
        expect(@c[input]).to eql 1
      end
  end

  it "should caculate in the sequence order" do
    input = "(1 + 2) * 3"
    expect(@c[input]).to eql 9
    input = "1 + 2 * 3"
    expect(@c[input]).to eql 7
  end
end
