class CreateReadings < ActiveRecord::Migration
  def change

    create_table :readings, id: :uuid do |t|
      t.float :value,         null: false
      t.string :subject_code, null: false, index: true, foreign_key: true
      t.uuid :measurement_id, null: false, index: true, foreign_key: true
      t.datetime :created_at, null: false
    end

  end
end
