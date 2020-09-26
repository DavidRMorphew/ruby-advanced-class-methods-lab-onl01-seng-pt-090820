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
    self.all<<song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all<<song
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    alph_song_names = []
    self.all.each {|song| alph_song_names << song.name}
    alph_song_names.sort!
    alph_song_names.map {|song_name| self.find_by_name(song_name)}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1][0..-5]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(" - ")[1].chomp(".mp3")
    new_song = self.create_by_name(song_name)
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
