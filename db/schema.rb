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

ActiveRecord::Schema[7.0].define(version: 2023_09_22_025130) do
  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "author"
    t.integer "post_id"
    t.string "content"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "author"
    t.string "img"
    t.string "content"
    t.integer "likes"
    t.binary "comments", size: :medium, default: -> { "X'5b5d'" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "avatar"
    t.string "email"
    t.string "name"
    t.string "username"
    t.string "password"
    t.binary "bookmarks", size: :medium, default: -> { "X'5b5d'" }
    t.binary "likes", size: :medium, default: -> { "X'5b5d'" }
    t.integer "follower"
    t.integer "following"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
