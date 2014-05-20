require 'json'
require 'zlib'

module Improvise
    module IO
        class DictionaryWriter
            attr_accessor :format, :gzip

            def initialize(opts={})
                @format = opts[:format] || :marshal
                @gzip = opts[:gzip] || false
            end

            def write(io, dictionary)
                dictionary_serialized = nil

                if @format == :json
                    dictionary_serialized = dictionary.to_json
                else
                    dictionary_serialized = Marshal.dump(dictionary)
                end

                if @gzip
                    gz = Zlib::GzipWriter.new(io)
                    gz.write(dictionary_serialized)
                    gz.close
                else
                    io.write(dictionary_serialized)
                    io.close
                end
            end

            def self.write(io, dictionary, opts={})
                DictionaryWriter.new(opts).write(io, dictionary)
            end
        end
    end
end