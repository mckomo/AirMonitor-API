class CreateSubjects < ActiveRecord::Migration
  def change

    create_table :subjects, id: :uuid do |t|
      t.string :code, limit: 16, null: false, index: true, unique: { unique: true }
      t.string :name, limit: 32, null: false
      t.string :unit, limit: 16, null: false
      t.timestamps
    end

  end
end
