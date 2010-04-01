require "mp3info"

class Track < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_attached_file :audio, 
                    :url => '/audio/:id/:basename.:extension',
                    :path => ":rails_root/public/audio/:id/:basename.:extension"
  
  
  def set_id3_info!
    Mp3Info.open(self.audio.path) do |mp3|
      self.title = mp3.tag.title
      self.artist = mp3.tag.artist
      self.save
    end
  end
  
  def destroy
    if self.audio.path
      File.delete(self.audio.path)
      Dir.delete(RAILS_ROOT + "/public/audio/#{self.id}")
    end
    super
  end
  
end
