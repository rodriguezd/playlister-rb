# require "pp"

require './lib/artist.rb'
require './lib/song.rb'
require './lib/genre.rb'

song_array = Dir.entries("./data")
song_array = song_array[2..song_array.size-1]
# song_array = ["Battles - Ice Cream (Feat. Matias Aguayo) [rock].mp3"]

def parse_songs(song_array)
  parsed_songs = []

  song_array.each do |x|
    split1 = x.split(" - ")
    artist = split1.shift

    split2 = split1.shift.split(" [")
    song_name = split2.shift

    split3 = split2.shift.split("]")
    genre = split3.shift

    parsed_song = [artist, song_name, genre]
    parsed_songs << parsed_song
  end

  parsed_songs
end

parsed_songs = parse_songs(song_array)

parsed_songs.each do |x|

  if Genre.all.any? {|genre| genre.name == x[2]}
    genre = Genre.all.select{|genre| genre.name == x[2]}.first
  else
    genre = Genre.new(x[2])
  end
  if Artist.all.any? {|artist| artist.name == x[0]}
    artist = Artist.all.select{|artist| artist.name == x[0]}.first
  else
    artist = Artist.new(x[0])
  end
  song = Song.new(artist, x[1], genre)
  song.genre = genre
  song.artist.add_song(song)

end



# puts Artist.all.count
# puts
# puts Song.all.count
# puts
# puts Genre.all.count

###########################
# DEALING WITH UNIQUENESS #
######### BELOW ###########

# def unique_artists(songs)
#   artists_array = []

#   songs.each do |song|
#     artists_array << song[0]
#   end

#   artists_array.uniq { |artist| artist }
# end

# def unique_genres(songs)
#   genres_array = []

#   songs.each do |song|
#     genres_array << song[2]
#   end

#   genres_array.uniq { |genre| genre }
# end

# def array_of_songs(songs)
#   array_of_songs = []

#   songs.each do |song|
#     array_of_songs << song[1]
#   end

#   array_of_songs
# end

# array_of_songs = array_of_songs(parsed_songs)
# unique_genres = unique_genres(parsed_songs)
# unique_artists = unique_artists(parsed_songs)

# unique_genres.each do |genre|
#   genre = Genre.new(genre)
# end

# unique_artists.each do |artist|
#   artist = Artist.new(artist)
# end

######### ABOVE ###########
# DEALING WITH UNIQUENESS #
###########################

# pp Genre.all
# pp Genre.all.size
# pp Artist.all
# pp Artist.count