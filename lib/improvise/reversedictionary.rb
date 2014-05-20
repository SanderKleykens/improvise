require 'improvise/dictionary'
require 'improvise/util/stringutils'

module Improvise
    class ReverseDictionary < Dictionary
        def initialize(depth=2, tree=nil)
            super(depth, tree)
        end

        def generate_word(length, root=nil)
            word = root || @tree.random_key

            while word.length < length do
                prefix = @tree.random_value(word[[-@depth, 0].max..-1])
                word = (prefix || @tree.random_key) + word
            end

            Improvise::Util::StringUtils.truncate(word.reverse, length, omission: '').reverse
        end

        def learn!(words)
            [*words].each do |word|
                start_of_word = word.reverse.slice(0..(@depth - 1)).reverse
                @tree.add_entry!('', start_of_word)

                word.split('').reverse.each_cons(@depth + 1) do |characters|
                    suffix = characters[0..(@depth - 1)].reverse.join('')
                    prefix = characters[depth]

                    @tree.add_entry!(suffix, prefix)
                end
            end
        end
    end
end