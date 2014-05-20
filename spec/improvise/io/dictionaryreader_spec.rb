require 'spec_helper'
require 'stringio'

describe Improvise::IO::DictionaryReader do
    before do
        json = '{
                  "json_class": "Improvise::ForwardDictionary",
                  "depth": 2,
                  "tree": {
                    "json_class": "Improvise::DictionaryTree",
                    "root": {
                      "name": "root",
                      "content": null,
                      "json_class": "Tree::TreeNode",
                      "children": [
                        {
                          "name": "",
                          "content": 1,
                          "json_class": "Tree::TreeNode",
                          "children": [
                            {
                              "name": "te",
                              "content": 1,
                              "json_class": "Tree::TreeNode"
                            }
                          ]
                        },
                        {
                          "name": "te",
                          "content": 1,
                          "json_class": "Tree::TreeNode",
                          "children": [
                            {
                              "name": "s",
                              "content": 1,
                              "json_class": "Tree::TreeNode"
                            }
                          ]
                        }
                      ]
                    }
                  }
                }'

        @json_buffer = StringIO.new(json)
        @json_reader = Improvise::IO::DictionaryReader.new(format: :json)
    end

    it "should read json input correctly" do
        dict = @json_reader.read(@json_buffer)
        expect(dict).to be_a(Improvise::ForwardDictionary)
        expect(dict.depth).to eq(2)
        expect(dict.generate_word(3)).to eq('tes')
    end

    it "should read json input correctly (class method)" do
        dict = Improvise::IO::DictionaryReader.read(@json_buffer, format: :json)
        expect(dict).to be_a(Improvise::ForwardDictionary)
        expect(dict.depth).to eq(2)
        expect(dict.generate_word(3)).to eq('tes')
    end
end