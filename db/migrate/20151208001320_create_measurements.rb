class CreateMeasurements < ActiveRecord::Migration
  def change

    create_table :measurements, id: :uuid do |t|
      t.float :value,         null: false
      t.datetime :time,       null: false, index: true
      t.string :source,       null: false, limit: 256,  default: ''
      t.string :subject_code, null: false, index: true, limit: 16, foreign_key: true
      t.uuid :station_id,     null: false, index: true, foreign_key: true
      t.uuid :user_id,        null: false, index: true, foreign_key: true
      t.datetime :created_at, null: false
    end

  end
end
