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

ActiveRecord::Schema.define(version: 20140131222829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hunches", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ideas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hunches", ["ideas_id"], name: "index_hunches_on_ideas_id", using: :btree

  create_table "hunches_ideas", id: false, force: true do |t|
    t.integer "idea_id",  null: false
    t.integer "hunch_id", null: false
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "robots_id"
    t.integer  "senses_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["robots_id"], name: "index_ideas_on_robots_id", using: :btree
  add_index "ideas", ["senses_id"], name: "index_ideas_on_senses_id", using: :btree

  create_table "robots", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "robots_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "senses", ["robots_id"], name: "index_senses_on_robots_id", using: :btree

end
