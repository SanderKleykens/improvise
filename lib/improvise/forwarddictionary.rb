require 'improvise/dictionary'

module Improvise
    class ForwardDictionary < Dictionary
        def initialize(depth=2, tree=nil)
            super(depth, tree)
        end

        def generate_word(length, root=nil)
            word = root || @tree.random_prefix
            word = word.slice(0..(length - 1))

            while word.length < length do
                suffix = @tree.random_suffix(word[[-@depth, 0].max..-1])
                word += suffix || @tree.random_prefix
                word = word.slice(0..(length - 1))
            end

            word
        end

        def learn!(words)
            [*words].each do |word|
                @tree.add_entry!('', word.slice(0..(@depth - 1)))

                word.split('').each_cons(@depth + 1) do |characters|
                    prefix = characters[0..-2].join('')
                    suffix = characters[-1]

                    @tree.add_entry!(prefix, suffix)
                end
            end
        end
    end
end