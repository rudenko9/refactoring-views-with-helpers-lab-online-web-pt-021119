class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    #self.artist ? self.artist.name : nil
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
