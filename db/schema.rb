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

ActiveRecord::Schema.define(version: 20160526201111) do

  create_table "courses", force: :cascade do |t|
    t.string   "department"
    t.string   "course_number"
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "offerings", force: :cascade do |t|
    t.integer  "semester"
    t.string   "location"
    t.integer  "section"
    t.string   "professor_last_name"
    t.integer  "spots_available"
    t.integer  "crn"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "course_id"
  end

  add_index "offerings", ["course_id"], name: "index_offerings_on_course_id"

end
