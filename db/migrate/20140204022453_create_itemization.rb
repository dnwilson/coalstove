class CreateItemization < ActiveRecord::Migration
  def change
    create_table :itemizations do |t|
      t.integer :item_id
      t.integer :transaction_id
      t.integer :position
    end
  end
end
