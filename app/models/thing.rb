class Thing < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  def select_without *columns
    select(column_names - columns.map(&:to_s))
  end

  def can_be_updated_by?(member)
    member.admin? || self.member_id == member.id
  end
end
