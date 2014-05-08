class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :thing_id
      t.integer :borrower_id
      t.integer :owner_id
      t.string :state

      t.timestamps
    end
  end
end
