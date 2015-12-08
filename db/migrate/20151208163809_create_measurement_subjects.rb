class CreateMeasurementSubjects < ActiveRecord::Migration
  def change

    create_table :measurement_subjects, id: false do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 32, null: false
      t.string :unit, limit: 16, null: false
      t.timestamps
    end

    add_index :measurement_subjects, :code, unique: true

  end
end
