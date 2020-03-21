require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')
require_relative('../bar')
require_relative('../drinks')

class DrinkTest < MiniTest::Test

  def setup()
    @drink_1 = Drink.new("Coke", 2.50)
    @drink_2 = Drink.new("Gin and Tonic", 3.75)
    @drink_3 = Drink.new("Cranberry and Vodka", 3.50)
    @drink_4 = Drink.new("Still Water", 2)
  end

  def test_get_name()
    assert_equal("Still Water", @drink_4.name)
  end

  def test_get_price()
    assert_equal(3.50, @drink_3.price)
  end
end
