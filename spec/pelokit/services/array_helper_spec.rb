require 'spec_helper'

describe Services::ArrayHelper do

    before :each do
      @obj = described_class.new
    end

    it 'should return the answer for a standard case' do
      input    = [13, 2, 3, 5, 7, 11]
      expected = 5
      expect(@obj.two_smallest input).to eq(expected)
    end

    it 'should handle negative numbers' do
      input    = [0, -13, -2, 3, 5, 7, -11]
      expected = -24
      expect(@obj.two_smallest input).to eq(expected)
    end

    it 'should handle a base case with trivial input' do
      input    = [-5, 5]
      expected = 0
      expect(@obj.two_smallest input).to eq(expected)
    end

    it 'should raise on invalid input' do
      input = [1]
      expect {
        @obj.two_smallest input
      }.to raise_error(Services::Error)

      input = []
      expect {
        @obj.two_smallest input
      }.to raise_error(Services::Error)

      input = nil
      expect {
        @obj.two_smallest input
      }.to raise_error(Services::Error)
    end


end
