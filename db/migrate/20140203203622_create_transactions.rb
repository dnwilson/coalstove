class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :account_name
      t.date :trans_date
      t.integer :trans_amount

      t.timestamps
    end
    add_index :transactions, [:id, :user_id, :item_id]
  end
end
