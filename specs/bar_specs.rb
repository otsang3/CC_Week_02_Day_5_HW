require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')
require_relative('../bar')
require_relative('../drinks')

class BarTest < MiniTest::Test

  def setup()
    @guest_1 = Guest.new("Oscar", 27, 100, "No Role Modelz")
    @guest_2 = Guest.new("Niamh", 24, 50, "Straight Outta Compton")
    @guest_3 = Guest.new("Olivia", 25, 10, "Zeze")
    @guest_4 = Guest.new("Erika", 47, 125, "My Heart Will Go On")
    @drink_1 = Drink.new("Coke", 2.50)
    @drink_2 = Drink.new("Gin and Tonic", 3.75)
    @drink_3 = Drink.new("Cranberry and Vodka", 3.50)
    @drink_4 = Drink.new("Still Water", 2)
    @drinks = [@drink_1, @drink_2, @drink_3, @drink_4]
    @bar_1 = Bar.new(@drinks)
  end

  def test_get_drinks()
    assert_equal(@drinks, @bar_1.drinks)
  end

  def test_get_cash_till()
    assert_equal(0, @bar_1.cash_till)
  end

  def test_add_cash()
    @bar_1.add_cash(4.50)
    assert_equal(4.50, @bar_1.cash_till)
  end

  def test_can_sell_drink__true()
    @bar_1.sell_drink_to_guest(@drink_1, @guest_1)
    assert_equal(97.50, @guest_1.money)
    assert_equal(2.50, @bar_1.cash_till)
    assert_equal([@drink_1], @bar_1.drinks_sold)
    assert_equal(1, @bar_1.no_of_drinks_sold)
  end

  def test_can_sell_drink__false()
    @guest_5 = Guest.new("Jim", 19, 2.50, "Super Bass")
    @bar_1.sell_drink_to_guest(@drink_2, @guest_5)
    assert_equal(2.50, @guest_5.money)
    assert_equal(0, @bar_1.cash_till)
    assert_equal([], @bar_1.drinks_sold)
    assert_equal(0, @bar_1.no_of_drinks_sold)
  end

end
