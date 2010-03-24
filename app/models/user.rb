class User < ActiveRecord::Base
  has_many :tracks
  has_many :comments
  
  def self.authorize(username, password)
    if user = find(:first, :conditions => {:username => username, :password => password })
      user.updated_at = Time.now
      return user if user.save
    end
    nil
  rescue ActiveRecord::RecordNotFound => e
    nil
  end  
end
