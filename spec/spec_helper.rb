if ENV['COVERAGE']
    require 'simplecov'

    SimpleCov.start do 
        add_filter('spec')

        add_group('Library', 'lib')
    end
end

require 'rspec'
require 'improvise'