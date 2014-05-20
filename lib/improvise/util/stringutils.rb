module Improvise
    module Util
        module StringUtils
            # Truncates a given +text+ after a given <tt>length</tt> if +text+ is longer than <tt>length</tt>:
            #
            #   truncate('Once upon a time in a world far far away', 27)
            #   # => "Once upon a time in a wo..."
            #
            # Pass a string or regexp <tt>:separator</tt> to truncate +text+ at a natural break:
            #
            #   truncate('Once upon a time in a world far far away', 27, separator: ' ')
            #   # => "Once upon a time in a..."
            #
            #   truncate('Once upon a time in a world far far away', 27, separator: /\s/)
            #   # => "Once upon a time in a..."
            #
            # The last characters will be replaced with the <tt>:omission</tt> string (defaults to "...")
            # for a total length not exceeding <tt>length</tt>:
            #
            #   truncate('And they found that many people were sleeping better.', 25, omission: '... (continued)')
            #   # => "And they f... (continued)"
            #
            # Adapted from Ruby on Rails (released under the MIT license)
            def self.truncate(string, truncate_at, options = {})
                return string.dup unless string.length > truncate_at

                options[:omission] ||= '...'
                length_with_room_for_omission = truncate_at - options[:omission].length
                stop = if options[:separator]
                           string.rindex(options[:separator], length_with_room_for_omission) || length_with_room_for_omission
                       else
                           length_with_room_for_omission
                       end

                "#{string[0...stop]}#{options[:omission]}"
            end
        end
    end
end