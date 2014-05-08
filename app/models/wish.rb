class Wish < ActiveRecord::Base
  belongs_to :member

  def can_be_updated_by?(member)
    member.admin? || self.member_id == member.id
  end
end
