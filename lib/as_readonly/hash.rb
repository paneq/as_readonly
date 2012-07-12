require 'delegate'

module AsReadonly
  # Be aware that #[] and #default are not blacklisted here
  # but they can change the internal state of Hash if default
  # proc is implemented to change the Hash itself:
  #
  # h = Hash.new {|h,k| h[k] = k*k }
  class Hash < DelegateClass(::Hash)
    REMOVED = %w|
         []= clear default= default_proc=
         delete delete_if replace  keep_if
         merge! update rehash reject!
         select! shift store
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
