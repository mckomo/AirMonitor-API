class CreateChannels < ActiveRecord::Migration[5.0]

  def change

    create_table :channels, id: :uuid do |t|
      t.string  :code,       null: false, limit: 16
      t.uuid    :station_id, null: false, index: true, foreign_key: true
      t.uuid    :subject_id, null: false, index: true, foreign_key: true
      t.uuid    :user_id,    null: false, index: true, foreign_key: true
      t.timestamps
    end

    add_index :channels, :code, unique: true

  end

end
