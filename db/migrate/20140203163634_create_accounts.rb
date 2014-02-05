class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name

      t.timestamps
    end
    add_index :accounts, [:id, :account_name]
  end
end
