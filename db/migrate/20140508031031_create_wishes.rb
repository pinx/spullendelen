class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :member_id
      t.index :member_id
      t.string :description
      t.string :story
      t.date :active_from
      t.date :active_to

      t.timestamps
    end
  end
end
