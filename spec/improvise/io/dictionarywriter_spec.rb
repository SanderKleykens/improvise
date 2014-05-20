require 'spec_helper'
require 'stringio'

describe Improvise::IO::DictionaryWriter do
    before do
        @dict = Improvise::ForwardDictionary.new(1)
        @dict.learn!('tes')

        @JSON = '{"json_class":"Improvise::ForwardDictionary","depth":1,"tree":{"json_class":"Improvise::DictionaryTree","root":{"name":"root","content":null,"json_class":"Tree::TreeNode","children":[{"name":"","content":1,"json_class":"Tree::TreeNode","children":[{"name":"t","content":1,"json_class":"Tree::TreeNode"}]},{"name":"t","content":1,"json_class":"Tree::TreeNode","children":[{"name":"e","content":1,"json_class":"Tree::TreeNode"}]},{"name":"e","content":1,"json_class":"Tree::TreeNode","children":[{"name":"s","content":1,"json_class":"Tree::TreeNode"}]}]}}}'
        @buffer = StringIO.new

        @json_writer = Improvise::IO::DictionaryWriter.new(format: :json)
        @json_gzip_writer = Improvise::IO::DictionaryWriter.new(format: :json, gzip: true)
        @marshal_writer = Improvise::IO::DictionaryWriter.new
        @marshal_gzip_writer = Improvise::IO::DictionaryWriter.new(gzip: true)
    end

    it "should write in json format correctly" do
        @json_writer.write(@buffer, @dict)
        expect(@buffer.string).to eq(@JSON)
        expect(@buffer.closed?).to be true
    end

    it "should write in json format correctly (class method)" do
        Improvise::IO::DictionaryWriter.write(@buffer, @dict, format: :json)
        expect(@buffer.string).to eq(@JSON)
        expect(@buffer.closed?).to be true
    end

    it "should write in marshal format" do
        @marshal_writer.write(@buffer, @dict)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end

    it "should write in marshal format (class method)" do
        Improvise::IO::DictionaryWriter.write(@buffer, @dict)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end

    it "should write in gzipped json format" do
        @json_gzip_writer.write(@buffer, @dict)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end

    it "should write in gzipped json format (class method)" do
        Improvise::IO::DictionaryWriter.write(@buffer, @dict, format: :json, gzip: true)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end

    it "should write in gzipped marshal format" do
        @marshal_gzip_writer.write(@buffer, @dict)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end

    it "should write in gzipped marshal format (class method)" do
        Improvise::IO::DictionaryWriter.write(@buffer, @dict, gzip: true)
        expect(@buffer.size).to be > 0
        expect(@buffer.closed?).to be true
    end
end