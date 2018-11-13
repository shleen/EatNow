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

ActiveRecord::Schema.define(version: 2018_11_12_144351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "card_no"
    t.string "cvv"
    t.string "card_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "collection_points", force: :cascade do |t|
    t.integer "number"
    t.integer "x"
    t.integer "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourite_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_item_id"
    t.bigint "user_id"
    t.index ["menu_item_id"], name: "index_favourite_items_on_menu_item_id"
    t.index ["user_id"], name: "index_favourite_items_on_user_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "waiting_time"
    t.boolean "vegetarian"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stall_id"
    t.index ["stall_id"], name: "index_menu_items_on_stall_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "qty"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "menu_item_id"
    t.boolean "completed", default: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "collection_point_id"
    t.bigint "payment_id"
    t.boolean "completed", default: false
    t.index ["collection_point_id"], name: "index_orders_on_collection_point_id"
    t.index ["hash_id"], name: "index_orders_on_hash_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "card_id"
    t.index ["card_id"], name: "index_payments_on_card_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_item_id"
    t.bigint "user_id"
    t.index ["menu_item_id"], name: "index_ratings_on_menu_item_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Staff"
  end

  create_table "stalls", force: :cascade do |t|
    t.string "name"
    t.boolean "halal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.bigint "stall_id"
    t.boolean "admin", default: false
    t.string "role", default: "customer"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["stall_id"], name: "index_users_on_stall_id"
  end

  add_foreign_key "cards", "users"
  add_foreign_key "favourite_items", "menu_items"
  add_foreign_key "favourite_items", "users"
  add_foreign_key "menu_items", "stalls"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "collection_points"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "cards"
  add_foreign_key "ratings", "menu_items"
  add_foreign_key "ratings", "users"
  add_foreign_key "users", "stalls"
end
