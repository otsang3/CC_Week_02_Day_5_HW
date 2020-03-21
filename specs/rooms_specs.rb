require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')
require_relative('../bar')
require_relative('../drinks')

class RoomTest < MiniTest::Test

  def setup()
    @guest_1 = Guest.new("Oscar", 27, 100, "No Role Modelz")
    @guest_2 = Guest.new("Niamh", 24, 50, "Straight Outta Compton")
    @guest_3 = Guest.new("Olivia", 25, 10, "Zeze")
    @guest_4 = Guest.new("Erika", 47, 125, "My Heart Will Go On")
    @guests = [@guest_1, @guest_2, @guest_3]
    @song_1 = Song.new("No Role Modelz", "J.Cole")
    @song_2 = Song.new("Umbrella", "Rihanna")
    @song_3 = Song.new("Still D.R.E", "Dr. Dre")
    @songs = [@song_1, @song_2]
    @drink_1 = Drink.new("Coke", 2.50)
    @drink_2 = Drink.new("Gin and Tonic", 3.75)
    @drink_3 = Drink.new("Cranberry and Vodka", 3.50)
    @drink_4 = Drink.new("Still Water", 2)
    @drinks = [@drink_1, @drink_2, @drink_3, @drink_4]
    @bar_1 = Bar.new(@drinks)
    @room_1 = Room.new("RnB", @guests, @songs, 25, 30, @bar_1)
  end

  def test_get_name()
    assert_equal("RnB", @room_1.name)
  end

  def test_get_entry_fee()
    assert_equal(25, @room_1.entry_fee)
  end

  def test_get_favourite_song()
    assert_equal("Zeze", @guest_3.favourite_song())
  end

  def test_number_of_guests()
    assert_equal(3, @room_1.number_of_guests())
  end

  def test_get_guest_limit()
    assert_equal(30, @room_1.guest_limit)
  end

  def test_add_guest__eligible()
    @room_1.add_guest(@guest_4)
    assert_equal(4, @room_1.number_of_guests())
    assert_equal(25, @room_1.cash_till)
  end

  def test_add_guest__ineligible()
    @room_1.add_guest(@guest_3)
    assert_equal(3, @room_1.number_of_guests())
    assert_equal("Sorry, you do not have enough money to pay the entry fee.", @room_1.add_guest(@guest_3))
  end

  def test_add_guest__ineligible_2()
    @room_2 = Room.new("RnB", @guests, @songs, 25, 3, @bar_1)
    @room_2.add_guest(@guest_4)
    assert_equal(3, @room_2.number_of_guests())
    assert_equal("Sorry, room has reached maximum capacity.", @room_2.add_guest(@guest_4))
  end

  def test_remove_guest()
    @room_1.remove_guest(@guest_1)
    assert_equal(2, @room_1.number_of_guests())
  end

  def test_find_guest_by_name()
    assert_equal(@guest_1, @room_1.find_guest_by_name("Oscar"))
  end

  def test_is_fave_song_on_playlist__true()
    assert_equal("Whoo!", @room_1.is_fave_song_on_playlist(@guest_1))
  end

  def test_is_fave_song_on_playlist__false()
    assert_nil(@room_1.is_fave_song_on_playlist(@guest_3))
  end

  def test_add_song()
    @room_1.add_song(@song_3)
    assert_equal(3, @room_1.number_of_songs())
  end






end
