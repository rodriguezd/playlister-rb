class Song
  attr_accessor :artist, :name, :genre

  SONGS_W_INFO = []

  def initialize(artist, name, genre)
    @name = name
    @artist = artist
    @genre = genre
    SONGS_W_INFO << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def self.all
    SONGS_W_INFO
  end
end