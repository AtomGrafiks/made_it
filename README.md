# Made_It ![Build Travis](https://api.travis-ci.org/AtomGrafiks/made_it.svg?branch=master) [![Gem Version](https://badge.fury.io/rb/made_it.svg)](https://badge.fury.io/rb/made_it)
A powerful gem to make what you want at your place. Made_It was created to group maximum of useful methods for Rails 5+ !

In first time, I create a model methods to minify model header (validations, associations, scope and co).

## Usage
How to use my plugin ?
#### Model Side
 - [has_many_trough](http://www.rubydoc.info/gems/made_it/0.0.1.pre.dev/MadeIt/ActiveRecord/ClassMethods#has_many_through-instance_method), a method to reduce has_many and has_many through association
 - [polymorphic_many_and_through](http://www.rubydoc.info/gems/made_it/0.0.1.pre.dev/MadeIt/ActiveRecord/ClassMethods#polymorphic_many_and_through-instance_method), a method to create polymorphic scope at your place

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'made_it'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install made_it
```

## Contributing [![Code Triagers Badge](https://www.codetriage.com/atomgrafiks/made_it/badges/users.svg)](https://www.codetriage.com/atomgrafiks/made_it)
If you want contribute to Made_It, make a pull request.

CODE GUIDELINES:
 - New features should be coupled with tests.
 - Your code respect all cops of Rubocop (except Style/LineLength).
 - Ensure that your code blends well with ours (eg, no trailing whitespace, match indentation and coding style).
 - Don’t modify the history file or version number

## Bugs and Feedback

If you discover any bugs, please describe it in the issues tracker, including Rails and MadeIt versions.

Questions are better handled on StackOverflow
## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
