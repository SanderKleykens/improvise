require 'json'
require 'zlib'

module Improvise
    module IO
        class DictionaryReader
            attr_accessor :format, :gzip

            def initialize(opts={})
                @format = opts[:format] || :marshal
                @gzip = opts[:gzip] || false
            end

            def read(io)
                input = nil

                if @gzip
                    gz = Zlib::GzipReader.new(io)
                    input = gz.read
                    gz.close
                else
                    input = io.read
                    io.close
                end

                if @format == :json
                    return JSON.load(input)
                else
                    return Marshal.load(input)
                end
            end

            def self.read(io, opts={})
                DictionaryReader.new(opts).read(io)
            end
        end
    end
end