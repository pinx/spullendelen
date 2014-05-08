class CreateMemberCircles < ActiveRecord::Migration
  def change
    create_table :member_circles do |t|
      t.integer :member_id
      t.index :member_id
      t.integer :circle_id
      t.index :circle_id

      t.timestamps
    end
  end
end
