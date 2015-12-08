class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings, id: :uuid do |t|
      t.int :subject
      t.float :value
      t.reference :measurement
      t.reference :user

      t.timestamps
    end
  end
end
