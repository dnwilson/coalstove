class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.boolean :order_delivery
      t.string :order_notes
      t.integer :order_total

      t.timestamps
    end
    
    add_index :orders, [:id, :user_id],   :unique => true
  end
end
