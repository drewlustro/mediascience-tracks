class User < ActiveRecord::Base
  has_many :tracks
  has_many :comments
  
  def self.authorize(username, password)
    begin
      user = find(:first, :conditions => {:username => username, :password => password })
      user.updated_at = Time.now
      if user.save
        user
      else
        nil
      end
    rescue ActiveRecord::RecordNotFound => e
      nil
    end
  end  
end
