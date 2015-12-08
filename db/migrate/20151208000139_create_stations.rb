class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations, id: :uuid do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.reference :user

      t.timestamps
    end
  end
end
