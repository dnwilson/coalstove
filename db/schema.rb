# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140205213451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "account_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["id", "account_name"], name: "index_accounts_on_id_and_account_name", using: :btree

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.string   "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_name", "id"], name: "index_categories_on_category_name_and_id", using: :btree
  add_index "categories", ["id", "account_id"], name: "index_categories_on_id_and_account_id", using: :btree

  create_table "categories_items", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "item_id"
  end

  create_table "categorizations", force: true do |t|
    t.integer "item_id"
    t.integer "category_id"
    t.integer "position"
  end

  create_table "itemizations", force: true do |t|
    t.integer "item_id"
    t.integer "transaction_id"
    t.integer "position"
  end

  create_table "items", force: true do |t|
    t.string   "item_name"
    t.integer  "item_amount", default: 0
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["id", "category_id"], name: "index_items_on_id_and_category_id", using: :btree
  add_index "items", ["item_name"], name: "index_items_on_item_name", unique: true, using: :btree

  create_table "items_transactions", id: false, force: true do |t|
    t.integer "transaction_id"
    t.integer "item_id"
  end

  create_table "menus", force: true do |t|
    t.string   "menu_name"
    t.integer  "menu_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_lines", force: true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "menu_id"
    t.integer  "order_line_qty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_lines", ["id", "user_id", "order_id", "menu_id"], name: "index_order_lines_on_id_and_user_id_and_order_id_and_menu_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.boolean  "order_delivery"
    t.string   "order_notes"
    t.integer  "order_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["id", "user_id"], name: "index_orders_on_id_and_user_id", unique: true, using: :btree

  create_table "transactions", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "account_name"
    t.date     "trans_date"
    t.integer  "trans_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["id", "user_id", "item_id"], name: "index_transactions_on_id_and_user_id_and_item_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "username"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "department"
    t.string   "address"
    t.string   "phone"
    t.string   "bbm"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
