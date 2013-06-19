class Artist
  attr_accessor :name, :songs, :genres

  ARTISTS = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
    ARTISTS << self
  end

  def songs_count
    @songs.size
  end

  def add_song(song)
    @songs << song
    @genres << song.genre
    song.genre.artists << self if !song.genre.artists.include?(self)
  end

#################
# CLASS METHODS #
#################
  def self.reset_artists
    ARTISTS.clear
  end

  def self.count
    ARTISTS.size
  end

  def self.all
    ARTISTS
  end
end