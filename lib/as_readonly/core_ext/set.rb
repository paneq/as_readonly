require 'as_readonly/set'

class Set
  def as_readonly
    AsReadonly::Set.new(self)
  end
end
