class Bar

  attr_reader :drinks, :cash_till, :drinks_sold,
  :no_of_drinks_sold

  def initialize(drinks)
    @drinks = drinks
    @cash_till = 0
    @drinks_sold = []
  end

  def add_cash(amount)
    @cash_till += amount
  end

  def add_drink_to_drinks_sold(drink)
    @drinks_sold << drink
  end

  def no_of_drinks_sold()
    @drinks_sold.size
  end

  def sell_drink_to_guest(drink, guest)
    if guest.money >= drink.price
      guest.remove_money(drink.price)
      add_cash(drink.price)
      add_drink_to_drinks_sold(drink)
    end
  end

end
