class Genre
  attr_accessor :name, :songs, :artists

  GENRES = []

  def initialize(name)
    @name = name
    @songs = []
    GENRES << self
    @artists = []
  end

  def count
    @songs.size
  end

#################
# CLASS METHODS #
#################
  def self.reset_genres
    GENRES.clear
  end

  def self.all
    GENRES
  end
end