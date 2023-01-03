# Write a minitest assertion that will fail if the value.odd? is not true.
require 'minitest/autorun'

class Values
  def odd?(value)
    true unless value % 2 == 0
  end
end

class ValuesTest < MiniTest::Test
  def test_odd?
    value = 2
    assert(value.odd?, 'value is not odd')
  end
end