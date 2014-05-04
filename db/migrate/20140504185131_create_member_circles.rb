class CreateMemberCircles < ActiveRecord::Migration
  def change
    create_table :member_circles do |t|
      t.integer :member_id
      t.integer :circle_id
    end
  end
end
