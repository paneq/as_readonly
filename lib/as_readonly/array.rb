require 'delegate'

module AsReadonly
  class Array < DelegateClass(::Array)
    REMOVED = %w|
         << []= clear concat delete delete_at delete_if
         flatten! insert map! pop push reject! replace
         reverse! shift slice! sort! uniq! unshift fill
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
