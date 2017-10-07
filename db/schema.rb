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

ActiveRecord::Schema.define(version: 20171005140601) do

  create_table "discs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.boolean "owns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dvd_id"
    t.integer "review_id"
    t.date "hidden"
    t.index ["dvd_id"], name: "index_discs_on_dvd_id"
    t.index ["movie_id"], name: "index_discs_on_movie_id"
    t.index ["review_id"], name: "index_discs_on_review_id"
    t.index ["user_id"], name: "index_discs_on_user_id"
  end

  create_table "dvds", force: :cascade do |t|
    t.string "condition"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster_file_name"
    t.string "poster_content_type"
    t.integer "poster_file_size"
    t.datetime "poster_updated_at"
    t.string "language"
    t.string "imdb_id"
    t.integer "tmdb_id"
    t.date "release_date"
    t.integer "tmdb_vote"
    t.integer "revenue", limit: 8
    t.integer "budget", limit: 8
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.date "birthday"
    t.string "born_in"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "plot_score"
    t.string "plot_comment"
    t.integer "acting_score"
    t.string "acting_comment"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "person_name"
    t.string "character_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
    t.integer "person_id"
    t.index ["movie_id"], name: "index_roles_on_movie_id"
    t.index ["person_id"], name: "index_roles_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
