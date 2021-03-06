# AsReadonly

Expose your collections as readonly objects without fear.


## Example

```ruby
  ara = AsReadonly::Array.new([1,2])
  ara[0]    # => 1
  ara.clear # raises NoMethodError
```

## Installation

Add this line to your application's `Gemfile`:

    gem 'as_readonly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install as_readonly

## Require

* `as_readonly/array`

        AsReadonly::Array

* `as_readonly/hash`

        AsReadonly::Hash

* `as_readonly/set`

        AsReadonly::Set

* `as_readonly/collections`

        as_readonly/array
        as_readonly/hash
        as_readonly/set`

* `as_readonly/core_ext/array`

        array.as_readonly # => AsReadonly::Array.new(array)

* `as_readonly/core_ext/hash`

        hash.as_readonly  # => AsReadonly::Hash.new(hash)

* `as_readonly/core_ext/set`

        set.as_readonly   # => AsReadonly::Set.new(set)

* `as_readonly/core_ext/collections`

        as_readonly/core_ext/array
        as_readonly/core_ext/hash
        as_readonly/core_ext/set

* `as_readonly/core_ext/module`

        Module#attr_readonly

        class MyClass
          attr_readonly :array
          def initialize
            @array = []
          end
        end

        MyClass.new.array.size  # => 0
        MyClass.new.array.clear # => NoMethodError exception

* `as_readonly/core_ext/all`

        as_readonly/core_ext/collections
        as_readonly/core_ext/module

* `as_readonly` - everything above


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

## Note

This gem does not prevent calling mutating methods on collection elements. Obviously.

```ruby
class MyClass
  def initialize
    @collection = ["asd"]
  end

  def collection
    @read_collection ||= AsReadonly::Array.new(@collection)
  end
end

c = MyClass.new
c.collection[0].upcase
```

## Inspirations

* http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/144294
* http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/144375
* http://msdn.microsoft.com/en-us/library/e78dcd75.aspx

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
