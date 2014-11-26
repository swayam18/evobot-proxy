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

ActiveRecord::Schema.define(version: 20141126110504) do

  create_table "cameras", force: true do |t|
    t.string   "snapshot_file_name"
    t.string   "snapshot_content_type"
    t.integer  "snapshot_file_size"
    t.datetime "snapshot_updated_at"
  end

  create_table "controller_errors", force: true do |t|
    t.decimal  "o_error"
    t.decimal  "p_error"
    t.integer  "robot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "iteration"
    t.integer  "state"
  end

  add_index "controller_errors", ["created_at"], name: "index_controller_errors_on_created_at", using: :btree

  create_table "positions", force: true do |t|
    t.decimal  "x"
    t.decimal  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "robot_id"
  end

  create_table "robots", force: true do |t|
    t.string   "name"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
