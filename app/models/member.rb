class Member < ActiveRecord::Base
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter, :google]

  #TODO omniauth callbacks moeten ingesteld worden
  #zie https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

  def address
    [street, city, state, country].compact.join(', ')
  end
end
