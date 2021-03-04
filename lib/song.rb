require 'pry'


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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end

  def self.find_by_name(song_title)
    self.all.find {|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end 

  def self.alphabetical
    self.all.sort_by(&:name)
  end 

  def self.new_from_filename(file_name)
    new_song = file_name[0..-5].split(" - ")
    song = self.new
    song.name = new_song[1]
    song.artist_name = new_song[0]
    song
  end

  def self.create_from_filename(file_name)
    new_song = file_name[0..-5].split(" - ")
    song = self.create
    song.name = new_song[1]
    song.artist_name = new_song[0]
    song
  end 

  def self.destroy_all
    self.all.clear
  end


   



end


