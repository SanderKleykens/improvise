require 'spec_helper'

describe Improvise::DictionaryTree do
    KEY = 'te'
    VALUE = 's'

    before do
        @empty_tree = Improvise::DictionaryTree.new
    end

    it "should return nil as random key if the tree is empty" do
        expect(@empty_tree.random_key).to eq(nil)
    end

    it "should return nil as random value if the prefix hasn't been found" do
        expect(@empty_tree.random_value('test')).to eq(nil)
    end

    it "should return nil as random value if the prefix is nil" do
        expect(@empty_tree.random_value(nil)).to eq(nil)
    end

    it "should return '#{KEY}'" do
        tree = Improvise::DictionaryTree.new
        tree.add_entry!(KEY, VALUE)

        expect(tree.random_key).to eq(KEY)
    end

    it "should return '#{VALUE}'" do
        tree = Improvise::DictionaryTree.new
        tree.add_entry!(KEY, VALUE)
        tree.add_entry!('aa', 's')

        expect(tree.random_value(KEY)).to eq(VALUE)
    end
end