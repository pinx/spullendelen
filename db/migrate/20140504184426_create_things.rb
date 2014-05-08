class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.integer :member_id
      t.index :member_id
      t.integer :category_id
      t.string :source
      t.string :source_id
      t.string :source_url
      t.integer :asset_id
      t.string :name
      t.string :creator
      t.integer :price
      t.text :description
      t.text :story
      t.date :active_from
      t.date :active_to
      t.boolean :borrow_everyone
      t.boolean :borrow_circles
      t.boolean :borrow_friends

      t.timestamps
    end
  end
end
