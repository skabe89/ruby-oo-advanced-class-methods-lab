

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|i| i.name}
  end

  def self.new_from_filename(file)
    song = Song.new
    file_array = file.split(" - ")
    artist = file_array[0]
    song_plus_file_type = file_array[1].split(".")
    name = song_plus_file_type[0]
    song.artist_name = artist
    song.name = name
    song
  end

  def self.create_from_filename(file)
    song = Song.new
    file_array = file.split(" - ")
    artist = file_array[0]
    song_plus_file_type = file_array[1].split(".")
    name = song_plus_file_type[0]
    song.artist_name = artist
    song.name = name
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
