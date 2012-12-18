class User < ActiveRecord::Base
  
  attr_accessible :email, :name, :provider, :token, :uid
  
  has_many :posts 
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]).tap do |u|
            u.update_attributes(:token => auth["credentials"]["token"] ) if u
         end || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.token = auth["credentials"]["token"] if auth["credentials"]["token"]      
    end    
  end
  
end
