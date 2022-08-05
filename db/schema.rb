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

ActiveRecord::Schema.define(version: 2022_07_21_204628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheets", force: :cascade do |t|
    t.string "message", limit: 100, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cheets_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "subscriber_id"
    t.bigint "subscribed_to_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscribed_to_id"], name: "index_subscriptions_on_subscribed_to_id"
    t.index ["subscriber_id", "subscribed_to_id"], name: "index_subscriptions_on_subscriber_id_and_subscribed_to_id", unique: true
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cheets", "users"
  add_foreign_key "subscriptions", "users", column: "subscribed_to_id"
  add_foreign_key "subscriptions", "users", column: "subscriber_id"
end
