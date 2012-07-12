require 'test_helper'
require 'as_readonly/hash'

class HashTest < MiniTest::Unit::TestCase
  def setup
    @hash = AsReadonly::Hash.new(@target = {})
  end

  def test_safe_method_delegated
    assert_equal 0, @hash.size
    assert @hash.respond_to?(:map)
  end

  def test_unsafe_method_removed
    refute @hash.respond_to?(:clear)
    assert_raises(NoMethodError) { @hash.clear }
  end

  def test_get
    @target = Hash.new {|h,k| h[k] = k*k }
    @hash = AsReadonly::Hash.new(@target)
    assert_equal 0, @hash.size
    @hash[10]
    assert_equal 1, @hash.size
  end

  def test_default
    @target = Hash.new {|h,k| h[k] = k*k }
    @hash = AsReadonly::Hash.new(@target)
    assert_equal 0, @hash.size
    @hash.default(10)
    assert_equal 1, @hash.size
  end
end
