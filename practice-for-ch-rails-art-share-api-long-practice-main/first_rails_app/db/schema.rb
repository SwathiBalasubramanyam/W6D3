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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_234105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_work_shares", force: :cascade do |t|
    t.bigint "art_work_id", null: false
    t.bigint "viewer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite"
    t.index ["art_work_id", "viewer_id"], name: "index_art_work_shares_on_art_work_id_and_viewer_id", unique: true
    t.index ["art_work_id"], name: "index_art_work_shares_on_art_work_id"
    t.index ["viewer_id"], name: "index_art_work_shares_on_viewer_id"
  end

  create_table "art_works", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite"
    t.index ["artist_id", "title"], name: "index_art_works_on_artist_id_and_title", unique: true
    t.index ["artist_id"], name: "index_art_works_on_artist_id"
    t.index ["image_url"], name: "index_art_works_on_image_url", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "art_work_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_work_id"], name: "index_comments_on_art_work_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.bigint "liker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["liker_id"], name: "index_likes_on_liker_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
  end

  add_foreign_key "art_work_shares", "art_works"
  add_foreign_key "art_work_shares", "users", column: "viewer_id"
  add_foreign_key "art_works", "users", column: "artist_id"
  add_foreign_key "comments", "art_works"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "likes", "users", column: "liker_id"
end
