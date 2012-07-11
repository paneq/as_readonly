# AsReadonly

Expose your collections as readonly objects without fear.

## Installation

Add this line to your application's Gemfile:

    gem 'as_readonly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install as_readonly

## Require

### Done

* `as_readonly/array` - Only `AsReadonly::Array` available

### TODO:

* `as_readonly/hash' - Only `AsReadonly::Hash` available
* `as_readonly/set' - Only `AsReadonly::Set` available
* `as_readonly/collections` - `as_readonly/array' + `as_readonly/hash' + `as_readonly/set`
* `as_readonly/core_ext/array` - `array.as_readonly == AsReadonly::Array.new(array)`
* `as_readonly/core_ext/hash` - `hash.as_readonly == AsReadonly::Hash.new(hash)`
* `as_readonly/core_ext/set` - `set.as_readonly == AsReadonly::Set.new(set)`
* `as_readonly/core_ext/collections` - `as_readonly/core_ext/array' + `as_readonly/core_ext/hash' + `as_readonly/core_ext/set`
* `as_readonly/core_ext/module` - `Module#attr_readonly`
* `as_readonly/core_ext/all` -  `as_readonly/core_ext/collections` + `as_readonly/core_ext/module`
* `as_readonly/all' - same as `as_readonly/core_ext/all`
* `as_readonly' - same as `as_readonl/all`


## Usage

```ruby
require 'as_readonly/array'

class MyClass
  def initialize
    @collection = []
  end

  def collection
    @read_collection ||= AsReadonly::Array.new(@collection)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
