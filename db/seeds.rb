# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(category_name: "Consumables", account_id: 2)
Category.create!(category_name: "Daily Sales", account_id: 2)
Category.create!(category_name: "Groceries", account_id: 2)
Category.create!(category_name: "Loans", account_id: 2)
Category.create!(category_name: "Maintenance", account_id: 2)
Category.create!(category_name: "Market", account_id: 2)
Category.create!(category_name: "Meats", account_id: 2)
Category.create!(category_name: "Misc", account_id: 2)
Category.create!(category_name: "Salary", account_id: 2)
Category.create!(category_name: "Sales", account_id: 1)
Category.create!(category_name: "Transportation", account_id: 2)
Category.create!(category_name: "Utilities", account_id: 2)

Account.create!(account_name: "Income")
Account.create!(account_name: "Expense")

admin = User.create!(name: "Admin", username: "admin", email: "admin@coalstove.com", admin: true, password: "1@mDamage", password_confirmation: "1@mDamage")