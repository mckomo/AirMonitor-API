# frozen_string_literal: true
class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations, id: :uuid do |t|
      t.string  :name,      null: false, limit: 64
      t.string  :code,      null: false, limit: 64
      t.float   :latitude,  null: false
      t.float   :longitude, null: false
      t.uuid    :user_id,   null: false, index: true, foreign_key: true
      t.timestamps
    end

    add_index :stations, :code, unique: true
  end
end
