class Member < ActiveRecord::Base
  has_many :things
  has_and_belongs_to_many :circles

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter, :google]

  #TODO omniauth callbacks moeten ingesteld worden
  #zie https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |member|
      member.provider = auth.provider
      member.uid = auth.uid
      member.email = auth.info.email
      member.password = Devise.friendly_token[0,20]
      member.name = auth.info.name   # assuming the member model has a name
      member.image = auth.info.image # assuming the member model has an image
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |member|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        member.email = data["email"] if member.email.blank?
      end
    end
  end

  def name
    name = "#{first_name} #{last_name}".strip
    name = nick_name if name.blank?
    name
  end

  def address
    [street, city, state, country].compact.join(', ')
  end
end
