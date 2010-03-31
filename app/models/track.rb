class Track < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_attached_file :audio, 
                    :url => '/audio/:id/:basename.:extension',
                    :path => ":rails_root/public/audio/:id/:basename.:extension"
  
  
  def destroy
    if self.audio.path
      File.delete(self.audio.path)
      Dir.delete(RAILS_ROOT + "/public/audio/#{self.id}")
    end
    super
  end
  
end
