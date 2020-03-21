class Guest

  attr_reader :name, :age, :money, :favourite_song

  def initialize(name, age, money, favourite_song)
    @name = name
    @age = age
    @money = money
    @favourite_song = favourite_song
  end

  def remove_money(amount)
    @money -= amount
  end


end
