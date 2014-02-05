class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.integer :menu_price

      t.timestamps
    end
  end
end
