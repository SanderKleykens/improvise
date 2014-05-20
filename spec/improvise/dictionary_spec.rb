require 'spec_helper'

describe Improvise::Dictionary do
    before do
        @dict1 = Improvise::Dictionary.new(1)
        @dict2 = Improvise::Dictionary.new
    end

    it "should have depth 1" do
        expect(@dict1.depth).to eq(1)
    end

    it "should have depth 2" do
        expect(@dict2.depth).to eq(2)
    end
end