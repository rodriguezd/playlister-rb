class Artist

attr_accessor :name, :songs, :genres

ARTISTS = []

def initialize(name = "")
  @name = name
  @songs = []
  @genres = []
  ARTISTS << self
end

def self.reset_artists
  ARTISTS.clear
end

def self.count
  ARTISTS.count
end

def self.all
  ARTISTS
end

def songs_count
  @songs.count
end

def add_song(song)
  @songs << song
  @genres << song.genre
  song.genre.artists << self unless song.genre.artists.include?(self)
end


end