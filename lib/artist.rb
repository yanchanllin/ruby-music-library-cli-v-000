class Artist
 #  extend Memorable::ClassMethods
 # include Memorable::InstanceMethods
 # include Paramable
 extend Concerns::Findable

  attr_accessor :name


    @@all = []

  def initialize(name)
     @name = name
     @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def artists
    @songs.collect do |song|
      song.artist
    end
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
   self.songs.collect do |song|
     song.genre
   end.uniq
 end

end
