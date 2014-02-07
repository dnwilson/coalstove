# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(category_name: "Consumables")
Category.create!(category_name: "Daily Sales")
Category.create!(category_name: "Groceries")
Category.create!(category_name: "Loans")
Category.create!(category_name: "Maintenance")
Category.create!(category_name: "Meats")
Category.create!(category_name: "Misc")
Category.create!(category_name: "Salary")
Category.create!(category_name: "Transportation")
Category.create!(category_name: "Utilities")


admin = User.create!(name: "Admin", username: "admin", email: "admin@coalstove.com", admin: true, password: "1@mDamage", password_confirmation: "1@mDamage")