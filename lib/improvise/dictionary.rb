require 'json'
require 'improvise/dictionarytree'

module Improvise
    class Dictionary
        attr_reader :depth

        def initialize(depth=2, tree=nil)
            @depth = depth
            @tree = tree || DictionaryTree.new
        end

        def as_json(opts = {})
            {
                JSON.create_id => self.class.name,
                'depth' => @depth,
                'tree' => @tree.as_json
            }
        end

        def to_json(*a)
            as_json.to_json(*a)
        end

        def self.json_create(json_hash)
            new(json_hash['depth'], json_hash['tree'])
        end
    end
end