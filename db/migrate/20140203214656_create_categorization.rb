class CreateCategorization < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :item_id
      t.integer :category_id
      t.integer :position
    end
  end
end
