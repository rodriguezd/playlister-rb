class Song

  attr_accessor :genre

  def initialize
    @genre = Genre.new
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

end
