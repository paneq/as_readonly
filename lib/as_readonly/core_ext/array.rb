require 'as_readonly/hash'

class Hash
  def as_readonly
    AsReadonly::Hash.new(self)
  end
end
