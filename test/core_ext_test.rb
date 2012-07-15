require 'test_helper'
require 'as_readonly/core_ext/all'

class CoreExtTest < MiniTest::Unit::TestCase
  def test_array_ext
    assert_instance_of AsReadonly::Array, [].as_readonly
  end

  def test_hash_ext
    assert_instance_of AsReadonly::Hash, {}.as_readonly
  end

  def test_set_ext
    assert_instance_of AsReadonly::Set, Set.new.as_readonly
  end

  class TestClass
    attr_readonly :hash, :array, :set
    def initialize
      @hash  = {}
      @array = []
      @set   = Set.new
    end
  end

  def test_attr_readonly_value
    tc = TestClass.new
    assert_instance_of AsReadonly::Array, tc.array
    assert_instance_of AsReadonly::Hash, tc.hash
    assert_instance_of AsReadonly::Set, tc.set
  end

  def test_attr_readonly_cache
    tc = TestClass.new
    assert_equal tc.array.object_id, tc.array.object_id
    refute tc.array.object_id == tc.instance_variable_get(:@array).object_id
  end
end

