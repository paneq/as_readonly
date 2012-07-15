require 'as_readonly/array'

class Array
  def as_readonly
    AsReadonly::Array.new(self)
  end
end
