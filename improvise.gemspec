require 'improvise/version'

Gem::Specification.new do |s|
    s.specification_version = 2 if s.respond_to? :specification_version=
    s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
    s.rubygems_version = '1.3.5'

    s.name = 'improvise'
    s.version = Improvise::VERSION
    s.platform = Gem::Platform::RUBY
    s.date = '2014-05-20'
    s.authors = ['Sander Kleykens']
    s.email = ['sander@kleykens.com']
    s.homepage = 'http://github.com/SanderKleykens/improvise'
    s.license = 'MIT'
    s.summary = 'Generate random words.'
    s.description = 'Improvise generates random words by learning from existing text.'

    s.require_paths = %w[lib]

    s.executables = ['improvise']

    s.rdoc_options = ['--charset=UTF-8']
    s.extra_rdoc_files = ['LICENSE', 'README.md']

    s.add_dependency('gli', '~> 2.10')
    s.add_dependency('json', '~> 1.8')
    s.add_dependency('pickup', '>= 0.0.9', '< 1.0')
    s.add_dependency('rubytree', '>= 0.9.3', '< 1.0')

    s.add_development_dependency('rake', '~> 10.3')
    s.add_development_dependency('rspec', '~> 2.0')
    s.add_development_dependency('simplecov', '~> 0.8')
    s.add_development_dependency('yard', '~> 0.8')

    ## Leave this section as-is. It is automatically generated from the
    ## contents of the Git repository via the gemspec task. DO NOT REMOVE
    ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
    # = MANIFEST =
    s.files = %w[
        Gemfile
        LICENSE
        README.md
        Rakefile
        bin/improvise
        improvise.gemspec
        lib/improvise.rb
        lib/improvise/dictionary.rb
        lib/improvise/dictionarytree.rb
        lib/improvise/forwarddictionary.rb
        lib/improvise/io/dictionaryreader.rb
        lib/improvise/io/dictionarywriter.rb
        lib/improvise/io/io.rb
        lib/improvise/version.rb
        spec/improvise/dictionary_spec.rb
        spec/improvise/dictionarytree_spec.rb
        spec/improvise/forwarddictionary_spec.rb
        spec/improvise/io/dictionaryreader_spec.rb
        spec/improvise/io/dictionarywriter_spec.rb
        spec/spec_helper.rb
  ]
    # = MANIFEST =

    s.test_files = s.files.select { |path| path =~ /^spec\/*_spec.*\.rb/ }
end
