class CreateMeasurements < ActiveRecord::Migration
  def change

    create_table :measurements, id: :uuid do |t|
      t.string :source, limit: 256, default: '', null: false
      t.datetime :time, null: false
      t.uuid :station_id, null: false
      t.uuid :user_id, null: false
      t.timestamps
    end

    add_index :measurements, :station_id
    add_index :measurements, :user_id

  end
end
