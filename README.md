# Improvise
Improvise generates random words by learning from existing text.

## Installation
Add this line to your application's Gemfile:

```
gem 'improvise'
```

And then execute:

```
$ bundle
```
Or install it yourself as:

```
$ gem install improvise
```

## Usage
Require the 'improvise' gem:

```ruby
require 'improvise'
```

### Learn
Create a new dictionary with depth 3:

```ruby
dict = Improvise::ForwardDictionary.new(3)
```

Or create a reversed dictionary with depth 3:

```ruby
dict = Improvise::ReverseDictionary.new(3)
```

Learn from a list of existing words:

```ruby
dict.learn!([
    'ruby', 
    'sapphire', 
    'pearl', 
    'diamond', 
    'amethyst', 
    'topaz', 
    'emerald'
])
```

### Generate
Generate a 6-letter word:

```ruby
dict.generate_word(6)
```

Generate a 7-letter word, starting with 'top':

```ruby
dict.generate_word(7, 'top')
```

### Store
Write a dictionary in Ruby's Marshal format to a file called 'dict.bin':

```ruby
dict_file = File.open('dict.bin', 'w')
Improvise::IO::DictionaryWriter.write(dict_file, dict)
```

Write a dictionary in Ruby's Marshal format, gzipped, to a file called 'dict.bin.gz':

```ruby
dict_file = File.open('dict.bin.gz', 'w')
Improvise::IO::DictionaryWriter.write(dict_file, dict, gzip: true)
```

Write a dictionary in json format, gzipped, to a file called 'dict.json.gz':

```ruby
dict_file = File.open('dict.json.gz', 'w')
Improvise::IO::DictionaryWriter.write(dict_file, dict, format: :json, gzip: true)
```

*Note: writing a dictionary closes the passed IO object.*

### Load
Restore a dictionary from a file called 'dict.bin' in Ruby's Marshal format:

```ruby
dict_file = File.open('dict.bin', 'r')
dict = Improvise::IO::DictionaryReader.read(dict_file)
```

Restore a dictionary from a file called 'dict.bin.gz' in Ruby's Marshal format, gzipped:

```ruby
dict_file = File.open('dict.bin.gz', 'r')
dict = Improvise::IO::DictionaryReader.read(dict_file, gzip: true)
```

Restore a dictionary from a file called 'dict.json.gz' in json format, gzipped:

```ruby
dict_file = File.open('dict.json.gz', 'r')
dict = Improvise::IO::DictionaryReader.read(dict_file, format: :json, gzip: true)
```

*Note: reading a dictionary closes the passed IO object.*

## Command-line tool
A command-line interface to the library has been provided under the name 'improvise'. 
Run `improvise --help` to get a list of available commands.

## Contributing
1. Fork
2. Branch (`git checkout -b my-new-feature`)
3. Commit (`git commit -am 'Added some feature'`)
4. Push (`git push origin my-new-feature`)
5. Pull request