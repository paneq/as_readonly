require 'as_readonly/collections'

class Module
  def attr_readonly(*attributes)
    attributes.each do |attr|
      module_eval <<-"end_eval", __FILE__, __LINE__
        def #{attr}
          @_#{attr}_as_readonly ||= begin
            @#{attr} ? @#{attr}.as_readonly : @#{attr}
          end
        end
      end_eval
    end
  end
end
