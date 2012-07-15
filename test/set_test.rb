require 'test_helper'
require 'as_readonly/set'

class SetTest < MiniTest::Unit::TestCase
  def setup
    @set = AsReadonly::Set.new(@target = Set.new)
  end

  def test_safe_method_delegated
    assert_equal 0, @set.size
    assert @set.respond_to?(:map)
  end

  def test_unsafe_method_removed
    refute @set.respond_to?(:map!)
    assert_raises(NoMethodError) { @set.map!{|x| x } }
  end
end

