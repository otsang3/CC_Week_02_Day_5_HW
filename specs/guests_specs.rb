require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')
require_relative('../bar')

class GuestTest < MiniTest::Test

  def setup()
    @guest_1 = Guest.new("Oscar", 27, 100, "No Role Modelz")
    @guest_2 = Guest.new("Niamh", 24, 50, "Straight Outta Compton")
    @guest_3 = Guest.new("Olivia", 25, 10, "Zeze")
    @guest_4 = Guest.new("Erika", 47, 125, "My Heart Will Go On")
  end

  def test_get_name()
    assert_equal("Oscar", @guest_1.name)
  end

  def test_get_age()
    assert_equal(27, @guest_1.age)
  end

  def test_get_money()
    assert_equal(100, @guest_1.money)
  end

  def test_remove_money()
    assert_equal(50, @guest_1.remove_money(50))
  end

  # def test_favourite_song_playing__true()
  #   assert_equal("Whoo!", @guest_1.favourite_song_playing("No Role Modelz"))
  # end

  # def test_favourite_song_playing__false()
  #   assert_nil(@guest_1.favourite_song_playing("Zeze"))
  # end

end
