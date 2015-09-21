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

ActiveRecord::Schema.define(version: 20150920091104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "position_title"
    t.boolean  "is_manager"
    t.string   "mon_start"
    t.string   "mon_end"
    t.string   "tues_start"
    t.string   "tues_end"
    t.string   "wed_start"
    t.string   "wed_end"
    t.string   "thurs_start"
    t.string   "thurs_end"
    t.string   "fri_start"
    t.string   "fri_end"
    t.string   "sat_start"
    t.string   "sat_end"
    t.string   "sun_start"
    t.string   "sun_end"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "shift_id"
    t.string   "employee"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "schedule_id"
    t.string   "day"
    t.datetime "start"
    t.datetime "end"
  end

  create_table "shifts", force: :cascade do |t|
    t.string   "start"
    t.string   "end"
    t.string   "active_days"
    t.boolean  "manager_only"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
