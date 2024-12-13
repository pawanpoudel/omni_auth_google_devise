class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [ :google_oauth2 ]

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
