class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements, id: :uuid do |t|
      t.string :source
      t.reference :station
      t.reference :user
      t.datetime :time

      t.timestamps
    end
  end
end
