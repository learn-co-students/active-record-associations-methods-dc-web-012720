class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.length 
  end

  def artist_count
    self.songs.map do |s|
      s.artist 
    end.uniq.count
  end

  def every_artist_in_genre 
    self.songs.map do |s|
      s.artist 
    end
  end 

  def all_artist_names
    self.every_artist_in_genre.map do |a|
      a.name 
    end 
    # return an array of strings containing every musician's name
  end
end
