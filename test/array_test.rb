require 'test_helper'
require 'as_readonly/array'

class ArrayTest < MiniTest::Unit::TestCase
  def setup
    @array = AsReadonly::Array.new(@target = [])
  end

  def test_safe_method_delegated
    assert_equal 0, @array.size
    assert @array.respond_to?(:map)
  end

  def test_unsafe_method_removed
    refute @array.respond_to?(:map!)
    assert_raises(NoMethodError) { @array.map!{|x| x } }
  end
end
