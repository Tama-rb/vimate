class User < ApplicationRecord
  def self.find_or_create_by_oauth(auth)
    uid         = auth[:uid]
    name        = auth[:info][:nickname]
    image_url   = auth[:info][:image]
    oauth_token = auth[:credentials][:token]

    self.find_or_create_by(uid: uid) do |user|
      user.uid         = uid
      user.name        = name
      user.image_url   = image_url
      user.oauth_token = oauth_token
    end
  end
end
