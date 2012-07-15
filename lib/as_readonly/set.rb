require 'set'
require 'delegate'

module AsReadonly
  class Set < DelegateClass(::Set)
    REMOVED = %w|
      << add add? clear collect! map! delete delete?
      delete_if flatten! keep_if merge reject! select!
    |.each do |method|
      undef_method(method)
    end

    def method_missing(*params)
      raise NoMethodError
    end

    def respond_to?(method, include_private = false)
      return false if REMOVED.include?(method.to_s)
      super
    end
  end
end
