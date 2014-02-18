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

ActiveRecord::Schema.define(version: 20140203052616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hunches", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hunches", ["idea_id"], name: "index_hunches_on_idea_id", using: :btree

  create_table "hunches_ideas", id: false, force: true do |t|
    t.integer "idea_id",  null: false
    t.integer "hunch_id", null: false
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "robot_id"
    t.integer  "sense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["robot_id"], name: "index_ideas_on_robot_id", using: :btree
  add_index "ideas", ["sense_id"], name: "index_ideas_on_sense_id", using: :btree

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
    t.text     "robotimages"
    t.integer  "robot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "senses", ["robot_id"], name: "index_senses_on_robot_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "type_of"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
