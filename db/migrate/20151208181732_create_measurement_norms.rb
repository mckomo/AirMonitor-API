class CreateMeasurementNorms < ActiveRecord::Migration
  def change

    create_table :measurement_norms, id: false do |t|
      t.string :subject_code, limit: 16, null: false
      t.string :interval, limit: 32, null: false
      t.float :value, null: false
      t.datetime :created_at, null: false
    end

    add_index :measurement_norms, :subject_code

  end
end
