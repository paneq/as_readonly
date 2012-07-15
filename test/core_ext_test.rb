require 'test_helper'
require 'as_readonly/core_ext/collections'

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
end

