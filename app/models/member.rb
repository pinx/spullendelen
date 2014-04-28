class Member < ActiveRecord::Base
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def address
    [street, city, state, country].compact.join(', ')
  end
end
