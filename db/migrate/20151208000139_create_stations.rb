class CreateStations < ActiveRecord::Migration
  def change

    create_table :stations, id: :uuid do |t|
      t.string :name, limit: 64, null: false
      t.string :code, limit: 64, default: '', null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.uuid :user_id, null: false
      t.timestamps
    end

    add_index :stations, :code, unique: true
    add_index :stations, :user_id

  end
end
