# create_table "submissions", force: :cascade do |t|
#   t.bigint "epoch_second", null: false
#   t.bigint "problem_id", null: false
#   t.bigint "contest_id", null: false
#   t.bigint "user_id", null: false
#   t.string "language", null: false
#   t.float "point", null: false
#   t.integer "length", null: false
#   t.integer "result", null: false
#   t.integer "execution_time"
# end

create_table :users, force: :cascade do |t|
  t.string :user_name, null: false
  t.integer :rating, null: false
  t.integer :highest, null: false
  t.timestamps
  t.index :user_name, unique: true
  t.index :rating
  t.index :highest
end

create_table :circle_users, force: :cascade do |t|
  t.bigint :circle_id, null: false
  t.bigint :user_id, null: false
  t.timestamps
  t.index [:circle_id, :user_id], unique: true
end

create_table :circles, force: :cascade do |t|
  t.string :circle_name, null: false
  t.timestamps
  t.index :circle_name, unique: true
end

create_table :virtual_contests, force: :cascade do |t|
  t.bigint :circle_id, null: false
  t.string :title, null: false
  t.string :url, null: false
  t.timestamps
  t.index :circle_id
end

# create_table "contests", force: :cascade do |t|
#   t.bigint "start_epoch_second", null: false
#   t.bigint "duration_second", null: false
#   t.string "title", null: false
#   t.string "rate_change", null: false
# end

# create_table "contest_problem", primary_key: ["contest_id", "problem_id"], force: :cascade do |t|
#   t.bigint "contest_id", null: false
#   t.bigint "problem_id", null: false
#   t.float "point", null: false
# end

# create_table "problems", force: :cascade do |t|
#   t.string "name", null: false
#   t.string "title", null: false
# end

