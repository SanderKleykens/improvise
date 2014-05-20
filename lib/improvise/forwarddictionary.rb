require 'improvise/dictionary'
require 'improvise/util/stringutils'

module Improvise
    class ForwardDictionary < Dictionary
        def initialize(depth=2, tree=nil)
            super(depth, tree)
        end

        def generate_word(length, root=nil)
            word = root || @tree.random_key

            while word.length < length do
                suffix = @tree.random_value(word[[-@depth, 0].max..-1])
                word += suffix || @tree.random_key
            end

            Improvise::Util::StringUtils.truncate(word, length, omission: '')
        end

        def learn!(words)
            [*words].each do |word|
                start_of_word = word.slice(0..(@depth - 1))
                @tree.add_entry!('', start_of_word)

                word.split('').each_cons(@depth + 1) do |characters|
                    prefix = characters[0..-2].join('')
                    suffix = characters[-1]

                    @tree.add_entry!(prefix, suffix)
                end
            end
        end
    end
end