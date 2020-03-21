require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')
require_relative('../bar')

class SongTest < MiniTest::Test

  def setup()
    @song_1 = Song.new("No Role Modelz", "J.Cole")
  end

  def test_get_name()
    assert_equal("No Role Modelz", @song_1.name)
  end

  def test_get_artist()
    assert_equal("J.Cole", @song_1.artist)
  end

end
