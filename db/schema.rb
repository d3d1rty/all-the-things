# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_19_042022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "state"
    t.string "city"
    t.string "zip"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.decimal "price", precision: 7, scale: 2
    t.decimal "cost", precision: 7, scale: 2
    t.datetime "released_at", precision: 6
    t.datetime "stocked_at", precision: 6
    t.datetime "sold_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sku"], name: "index_items_on_sku"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "item_id", null: false
    t.decimal "principal", precision: 9, scale: 2
    t.decimal "interest_rate", precision: 7, scale: 2
    t.datetime "maturity_date", precision: 6
    t.datetime "default_date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_loans_on_customer_id"
    t.index ["item_id"], name: "index_loans_on_item_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.decimal "sale_price", precision: 7, scale: 2
    t.decimal "profit", precision: 7, scale: 2
    t.decimal "calculated_tax", precision: 7, scale: 2
    t.datetime "date_of_sale", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_transactions_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "loans", "customers"
  add_foreign_key "loans", "items"
  add_foreign_key "transactions", "items"
end
