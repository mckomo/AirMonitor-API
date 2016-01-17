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

ActiveRecord::Schema.define(version: 20160106191737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "measurements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.float    "value",                               null: false
    t.datetime "time",                                null: false
    t.string   "source",     limit: 256, default: "", null: false
    t.uuid     "subject_id",                          null: false
    t.uuid     "station_id",                          null: false
    t.uuid     "user_id",                             null: false
    t.datetime "created_at",                          null: false
    t.index ["station_id"], name: "index_measurements_on_station_id", using: :btree
    t.index ["subject_id"], name: "index_measurements_on_subject_id", using: :btree
    t.index ["time"], name: "index_measurements_on_time", using: :btree
    t.index ["user_id"], name: "index_measurements_on_user_id", using: :btree
  end

  create_table "norms", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.float    "value",                 null: false
    t.integer  "level",                 null: false
    t.string   "interval",   limit: 32, null: false
    t.uuid     "subject_id",            null: false
    t.uuid     "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["level"], name: "index_norms_on_level", using: :btree
    t.index ["subject_id"], name: "index_norms_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_norms_on_user_id", using: :btree
  end

  create_table "stations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",       limit: 64, null: false
    t.string   "code",       limit: 64, null: false
    t.float    "latitude",              null: false
    t.float    "longitude",             null: false
    t.uuid     "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_stations_on_code", unique: true, using: :btree
    t.index ["user_id"], name: "index_stations_on_user_id", using: :btree
  end

  create_table "subjects", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",       limit: 16, null: false
    t.string   "symbol",     limit: 32, null: false
    t.string   "name",       limit: 32, null: false
    t.string   "unit",       limit: 16, null: false
    t.uuid     "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_subjects_on_code", using: :btree
    t.index ["user_id"], name: "index_subjects_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                   limit: 64,              null: false
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
