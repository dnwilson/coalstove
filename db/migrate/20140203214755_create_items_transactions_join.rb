class CreateItemsTransactionsJoin < ActiveRecord::Migration
  def up
    create_table :items_transactions, :id => false do |t|
      t.integer :transaction_id
      t.integer :item_id
    end
  end
  
  def down
     drop_table :items_transactions
  end
end
