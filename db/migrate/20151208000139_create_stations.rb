class CreateStations < ActiveRecord::Migration
  def change

    create_table :stations, id: :uuid do |t|
      t.string :name,     null: false, limit: 64
      t.string :code,     null: false, limit: 64,   index: { unique: true }
      t.float :latitude,  null: false
      t.float :longitude, null: false
      t.uuid :subscriber, null: false, index: true, foreign_key: true
      t.timestamps
    end

  end
end
