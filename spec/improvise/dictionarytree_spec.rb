require 'spec_helper'

describe Improvise::DictionaryTree do
    PREFIX = 'te'
    SUFFIX = 's'

    before do
        @empty_tree = Improvise::DictionaryTree.new
    end

    it "should return nil as random prefix if the tree is empty" do
        expect(@empty_tree.random_prefix).to eq(nil)
    end

    it "should return nil as random suffix if the prefix hasn't been found" do
        expect(@empty_tree.random_suffix('test')).to eq(nil)
    end

    it "should return nil as random suffix if the prefix is nil" do
        expect(@empty_tree.random_suffix(nil)).to eq(nil)
    end

    it "should return '#{PREFIX}'" do
        tree = Improvise::DictionaryTree.new
        tree.add_entry!(PREFIX, SUFFIX)

        expect(tree.random_prefix).to eq(PREFIX)
    end

    it "should return '#{SUFFIX}'" do
        tree = Improvise::DictionaryTree.new
        tree.add_entry!(PREFIX, SUFFIX)
        tree.add_entry!('aa', 's')

        expect(tree.random_suffix(PREFIX)).to eq(SUFFIX)
    end
end