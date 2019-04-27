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

create_table :users, id: :string, primary_key: :user_name, force: :cascade do |t|
  t.integer :rating, null: false
  t.integer :highest, null: false
  t.index :rating
  t.index :highest
end

create_table :circle_users, force: :cascade do |t|
  t.string :circle_name, null: false
  t.string :user_name, null: false
  t.index [:circle_name, :user_name], unique: true
end

create_table :circles, id: :string, primary_key: :circle_name, force: :cascade do |t|
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

