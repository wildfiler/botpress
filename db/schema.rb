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

ActiveRecord::Schema.define(version: 20161102113531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bots", force: :cascade do |t|
    t.string "steam_id", null: false
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.index ["account_id"], name: "index_bots_on_account_id", using: :btree
    t.index ["slug"], name: "index_bots_on_slug", using: :btree
  end

  create_table "filter_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_filter_types_on_game_id", using: :btree
  end

  create_table "filter_values", force: :cascade do |t|
    t.string "value", null: false
    t.integer "filter_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "items_count", default: 0, null: false
    t.index ["filter_type_id"], name: "index_filter_values_on_filter_type_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id", null: false
    t.string "name", null: false
    t.boolean "published", default: false, null: false
    t.integer "items_count", default: 0, null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_games_on_slug", using: :btree
  end

  create_table "item_filter_values", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "filter_value_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_value_id"], name: "index_item_filter_values_on_filter_value_id", using: :btree
    t.index ["item_id"], name: "index_item_filter_values_on_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.text "raw"
    t.integer "bot_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "steam_id"
    t.string "classid"
    t.string "instanceid"
    t.string "amount"
    t.string "name"
    t.string "market_hash_name"
    t.text "description"
    t.string "icon_url"
    t.string "icon_large_url"
    t.string "item_type"
    t.string "name_color"
    t.string "background_color"
    t.index ["bot_id"], name: "index_items_on_bot_id", using: :btree
    t.index ["game_id"], name: "index_items_on_game_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "admin", default: false, null: false
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "bots", "accounts"
  add_foreign_key "items", "bots"
  add_foreign_key "items", "games"
  add_foreign_key "users", "accounts"
end
