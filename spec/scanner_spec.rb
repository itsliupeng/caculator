require_relative 'spec_helper'

describe Scanner do
  before :each do
    @s = Scanner.new('')
  end

  context "#{}str_to_num" do
    it "should work with integer" do
      expect(@s.str_to_num("1")).to eql 1
    end
    it "should work with float" do
      expect(@s.str_to_num("1.0")).to eql 1.0
    end
    it "should work with number with '_'" do
      expect(@s.str_to_num("10_000")).to eql 10000
    end
    it "should work with number ends with '_'" do
      expect(@s.str_to_num("1_")).to eql 1
    end
    it "should work with number ends with '.'" do
      expect(@s.str_to_num("1.")).to eql 1
    end
    it "should raise Arguement error for illegal input" do
       expect{ @s.str_to_num("1a") }.to raise_error ArgumentError
    end
  end

  context '#scan' do
    context 'test ()' do
      it "should work with ()" do
        @s.instance_variable_set(:@str, " 1.0 + (2 + 3)")
        expect(@s.scan).to eql [['+'], [1.0, 5]]
      end
      it "should work when begin with ()" do
        @s.instance_variable_set(:@str, "(1.0 + 2)")
        expect(@s.scan).to eql [[], [3.0]]
      end

      it "should work when multiple ()" do
        @s.instance_variable_set(:@str, "(1.0 + (2 + 3))")
        expect(@s.scan).to eql [[], [6.0]]
      end

      it "should work when (num)" do
        @s.instance_variable_set(:@str, "(1.0)")
        expect(@s.scan).to eql [[], [1.0]]
      end
    end
  end
end
