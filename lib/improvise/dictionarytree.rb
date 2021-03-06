require 'json'
require 'tree'
require 'pickup'

module Improvise
    class DictionaryTree
        def initialize(root=nil)
            @root = root || Tree::TreeNode.new('root')
        end

        def add_entry!(key, value)
            key_node = DictionaryTree.add_node!(@root, key)
            key_node.content += 1

            value_node = DictionaryTree.add_node!(key_node, value)
            value_node.content += 1
        end

        def random_key
            DictionaryTree.new_pickup(@root).pick
        end

        def random_value(key)
            if key.nil?
                return nil
            end

            node = @root[key]

            if node.nil?
                return nil
            else
                return DictionaryTree.new_pickup(node).pick
            end
        end

        def as_json(opts = {})
            {
                JSON.create_id => self.class.name,
                'root' => @root.as_json
            }
        end

        def to_json(*a)
            as_json.to_json(*a)
        end

        def self.json_create(json_hash)
            new(json_hash['root'])
        end

        private
        def self.add_node!(root, key)
            node = root[key]

            if node.nil?
                node = Tree::TreeNode.new(key, 0)
                root << node
            end

            node
        end

        def self.new_pickup(node)
            key_func = Proc.new { |item| item.name }
            weight_func = Proc.new { |item| item.content }
            Pickup.new(node.children, key_func: key_func, weight_func: weight_func)
        end
    end
end