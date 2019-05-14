# frozen_string_literal: true

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
  t.index %i[circle_id user_id], unique: true
end

create_table :circles, force: :cascade do |t|
  t.string :circle_name, null: false
  t.string :password_digest, null: false
  t.boolean :private, null: false
  t.boolean :university, null: false, default: false
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

create_table :contests, id: :string, force: :cascade do |t|
  t.string :title, null: false
  t.integer :start_epoch_second, null: false
  t.timestamps
  t.index :start_epoch_second
end

create_table :tasks, force: :cascade do |t|
  t.string :contest_id, null: false
  t.string :heading, null: false
  t.string :url, null: false
  t.timestamps
  t.index :contest_id
end

create_table :standings, force: :cascade do |t|
  t.string :contest_id, null: false
  t.string :user_name, null: false
  t.integer :rank, null: false
  t.integer :final_score
  t.integer :final_penalty
  t.string :final_time
  t.timestamps
  t.index :contest_id
  t.index :user_name
  t.index :rank
end

create_table :submissions, force: :cascade do |t|
  t.bigint :standing_id, null: false
  t.integer :score
  t.integer :penalty
  t.string :time
  t.timestamps
  t.index :standing_id
end
