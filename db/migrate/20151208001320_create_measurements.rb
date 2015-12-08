class CreateMeasurements < ActiveRecord::Migration
  def change

    create_table :measurements, id: :uuid do |t|
      t.string :source,   null: false, limit: 256,  default: ''
      t.datetime :time,   null: false
      t.uuid :station_id, null: false, index: true, foreign_key: true
      t.uuid :user_id,    null: false, index: true, foreign_key: true
      t.timestamps
    end

  end
end
