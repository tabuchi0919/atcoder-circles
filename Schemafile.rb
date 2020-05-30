# frozen_string_literal: true

create_table :users, force: :cascade do |t|
  t.string :user_name, null: false
  t.integer :rating
  t.integer :highest
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
  t.datetime :login_at
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
