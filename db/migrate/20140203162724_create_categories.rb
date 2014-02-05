class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :account_id

      t.timestamps
    end
    add_index :categories, [:category_name, :id]
    add_index :categories, [:id, :account_id]
  end
end
