# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180110095422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "isbn"
    t.string   "author"
    t.decimal  "price"
    t.string   "publication"
    t.string   "version"
    t.integer  "library_id"
    t.integer  "category_id"
    t.integer  "issue_history_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree
  add_index "books", ["issue_history_id"], name: "index_books_on_issue_history_id", using: :btree
  add_index "books", ["library_id"], name: "index_books_on_library_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_histories", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "book_id"
    t.date     "date_of_issue"
    t.date     "date_of_return"
    t.integer  "status"
    t.integer  "copies"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "issue_histories", ["member_id"], name: "index_issue_histories_on_member_id", using: :btree

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.integer  "gender"
    t.integer  "code"
    t.date     "validity_date"
    t.boolean  "is_author"
    t.integer  "library_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "members", ["library_id"], name: "index_members_on_library_id", using: :btree

  add_foreign_key "books", "categories"
  add_foreign_key "books", "issue_histories"
  add_foreign_key "books", "libraries"
  add_foreign_key "issue_histories", "members"
  add_foreign_key "members", "libraries"
end
