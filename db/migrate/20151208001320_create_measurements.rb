# frozen_string_literal: true
class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements, id: :uuid do |t|
      t.float :value,         null: false
      t.string :source,       null: false, limit: 256, default: ''
      t.datetime :time,       null: false, index: true
      t.uuid :channel_id,     null: false, index: true, foreign_key: true
      t.uuid :user_id,        null: false, index: true, foreign_key: true
      t.datetime :created_at, null: false
    end
  end
end
