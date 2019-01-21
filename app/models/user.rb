class User < ApplicationRecord
  def self.find_or_create_by_oauth(auth)
    uid         = auth[:uid]
    name        = auth[:info][:nickname]
    oauth_token = auth[:credentials][:token]

    self.find_or_create_by(uid: uid) do |user|
      user.uid         = uid
      user.name        = name
      user.oauth_token = oauth_token
    end
  end
end
