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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circle_users", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id", "user_id"], name: "index_circle_users_on_circle_id_and_user_id", unique: true
  end

  create_table "circles", force: :cascade do |t|
    t.string "circle_name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", null: false
    t.index ["circle_name"], name: "index_circles_on_circle_name", unique: true
  end

  create_table "contests", id: :string, force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_epoch_second", null: false
    t.index ["start_epoch_second"], name: "index_contests_on_start_epoch_second"
  end

  create_table "standings", force: :cascade do |t|
    t.string "contest_id", null: false
    t.string "user_name", null: false
    t.integer "rank", null: false
    t.integer "final_score"
    t.integer "final_penalty"
    t.string "final_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_standings_on_contest_id"
    t.index ["rank"], name: "index_standings_on_rank"
    t.index ["user_name"], name: "index_standings_on_user_name"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "standing_id", null: false
    t.integer "score"
    t.integer "penalty"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standing_id"], name: "index_submissions_on_standing_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "contest_id", null: false
    t.string "heading", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_tasks_on_contest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.integer "rating", null: false
    t.integer "highest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["highest"], name: "index_users_on_highest"
    t.index ["rating"], name: "index_users_on_rating"
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  create_table "virtual_contests", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.string "title", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_virtual_contests_on_circle_id"
  end

end
