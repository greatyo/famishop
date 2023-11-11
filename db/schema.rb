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

ActiveRecord::Schema[7.0].define(version: 2023_11_11_065702) do
  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "unit_quantity", null: false
    t.integer "price", null: false
    t.bigint "shop_id", null: false
    t.bigint "category_id", null: false
    t.text "remarks", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["family_id"], name: "index_items_on_family_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "shop_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "families"
  add_foreign_key "items", "shops"
end
