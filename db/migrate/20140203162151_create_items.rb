class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string    :item_name
      t.integer   :item_amount,   :default => 0
      t.integer   :category_id

      t.timestamps
    end
    add_index :items, :item_name,               :unique => true
    add_index :items, [:id, :category_id]
  end
end
