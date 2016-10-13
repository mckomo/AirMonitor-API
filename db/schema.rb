# encoding: UTF-8
# frozen_string_literal: true
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

ActiveRecord::Schema.define(version: 20_160_131_161_426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'channels', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.string   'code', limit: 16, null: false
    t.uuid     'station_id',            null: false
    t.uuid     'subject_id',            null: false
    t.uuid     'user_id',               null: false
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'channels', ['code'], name: 'index_channels_on_code', unique: true, using: :btree
  add_index 'channels', ['station_id'], name: 'index_channels_on_station_id', using: :btree
  add_index 'channels', ['subject_id'], name: 'index_channels_on_subject_id', using: :btree
  add_index 'channels', ['user_id'], name: 'index_channels_on_user_id', using: :btree

  create_table 'measurements', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.float    'value',                               null: false
    t.string   'source', limit: 256, default: '', null: false
    t.datetime 'time',                                null: false
    t.uuid     'channel_id',                          null: false
    t.uuid     'user_id',                             null: false
    t.datetime 'created_at',                          null: false
  end

  add_index 'measurements', ['channel_id'], name: 'index_measurements_on_channel_id', using: :btree
  add_index 'measurements', ['time'], name: 'index_measurements_on_time', using: :btree
  add_index 'measurements', ['user_id'], name: 'index_measurements_on_user_id', using: :btree

  create_table 'norms', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.float    'value', null: false
    t.string   'interval', limit: 32, null: false
    t.integer  'level',                 null: false
    t.uuid     'subject_id',            null: false
    t.uuid     'user_id',               null: false
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'norms', ['level'], name: 'index_norms_on_level', using: :btree
  add_index 'norms', ['subject_id'], name: 'index_norms_on_subject_id', using: :btree
  add_index 'norms', ['user_id'], name: 'index_norms_on_user_id', using: :btree

  create_table 'stations', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.string   'name',       limit: 64, null: false
    t.string   'code',       limit: 64, null: false
    t.float    'latitude',              null: false
    t.float    'longitude',             null: false
    t.uuid     'user_id',               null: false
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'stations', ['code'], name: 'index_stations_on_code', unique: true, using: :btree
  add_index 'stations', ['user_id'], name: 'index_stations_on_user_id', using: :btree

  create_table 'subjects', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.string   'code',       limit: 16, null: false
    t.string   'symbol',     limit: 32, null: false
    t.string   'name',       limit: 32, null: false
    t.string   'unit',       limit: 16, null: false
    t.uuid     'user_id',               null: false
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'subjects', ['code'], name: 'index_subjects_on_code', unique: true, using: :btree
  add_index 'subjects', ['user_id'], name: 'index_subjects_on_user_id', using: :btree

  create_table 'users', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.string 'name',  limit: 64, null: false
    t.string 'email', limit: 64, null: false
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
end
