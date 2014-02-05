class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :menu_id
      t.integer :order_line_qty

      t.timestamps
    end
    add_index :order_lines, [:id, :user_id, :order_id, :menu_id]
  end
end
