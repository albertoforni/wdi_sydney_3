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

ActiveRecord::Schema.define(version: 20140131031048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cover_image"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id", using: :btree

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_songs", force: true do |t|
    t.integer "genre_id"
    t.integer "song_id"
  end

  add_index "genres_songs", ["genre_id"], name: "index_genres_songs_on_genre_id", using: :btree
  add_index "genres_songs", ["song_id"], name: "index_genres_songs_on_song_id", using: :btree

  create_table "playlists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists_songs", force: true do |t|
    t.integer "song_id"
    t.integer "playlist_id"
  end

  add_index "playlists_songs", ["playlist_id"], name: "index_playlists_songs_on_playlist_id", using: :btree
  add_index "playlists_songs", ["song_id"], name: "index_playlists_songs_on_song_id", using: :btree

  create_table "songs", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.text     "description"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree

end
