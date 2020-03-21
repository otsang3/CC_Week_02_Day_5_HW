class Room

  attr_reader :name, :guests, :songs, :entry_fee,
  :guest_limit, :cash_till, :bar

  def initialize(name, guests, songs, entry_fee, guest_limit, bar)
    @name = name
    @guests = guests
    @songs = songs
    @entry_fee = entry_fee
    @guest_limit = guest_limit
    @cash_till = 0
    @bar = bar
  end

  def number_of_guests()
    return @guests.size
  end

  def number_of_songs()
    return @songs.size
  end

  def add_guest(guest)
    if @guests.size < @guest_limit && guest.money >= @entry_fee
      @guests << guest
      @cash_till += @entry_fee
      guest.remove_money(@entry_fee)
    elsif guest.money <= @entry_fee
      return "Sorry, you do not have enough money to pay the entry fee."
    else @guests.size >= @guest_limit
      return "Sorry, room has reached maximum capacity."
    end
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def find_guest_by_name(name)
    @guests.find {|guest| guest.name == name}
  end

  def add_song(song)
    @songs << song
  end

  def is_fave_song_on_playlist(guest)
    found_song = @songs.find {|song| song.name == guest.favourite_song}
    if found_song != nil
      return "Whoo!"
    end
  end

end
