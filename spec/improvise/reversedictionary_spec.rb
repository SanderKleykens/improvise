require 'spec_helper'

describe Improvise::ReverseDictionary do
    before do
        @dict1 = Improvise::ReverseDictionary.new(1)
        @dict2 = Improvise::ReverseDictionary.new
    end

    it "should have depth 1" do
        expect(@dict1.depth).to eq(1)
    end

    it "should have depth 2" do
        expect(@dict2.depth).to eq(2)
    end

    it "should generate 'te' using depth 1" do
        @dict1.learn!('te')
        expect(@dict1.generate_word(2, 'e')).to eq('te')
    end

    it "should generate 'te' using depth 2" do
        @dict2.learn!('te')
        expect(@dict2.generate_word(2)).to eq('te')
    end

    it "should generate 'tes' using depth 2" do
        @dict2.learn!('tes')
        expect(@dict2.generate_word(3, 'es')).to eq('tes')
    end
end