class CreateItemTransaction < ActiveRecord::Migration
  def change
    create_table :itemtransaction do |t|
      t.integer :item_id
      t.integer :transaction_id
      t.integer :position
    end
  end
end
