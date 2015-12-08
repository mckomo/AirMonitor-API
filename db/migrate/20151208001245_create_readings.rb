class CreateReadings < ActiveRecord::Migration
  def change

    create_table :readings, id: :uuid do |t|
      t.string :subject_code, limit: 16, null: false
      t.float :value, null: false
      t.uuid :measurement_id, null: false
      t.datetime :created_at, null: false
    end

    add_index :readings, :subject_code
    add_index :readings, :measurement_id

  end
end
