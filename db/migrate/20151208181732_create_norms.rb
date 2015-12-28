class CreateNorms < ActiveRecord::Migration
  def change

    create_table :norms, id: :uuid do |t|
      t.float :value,         null: false
      t.integer :level,       null: false, index: true
      t.string :interval,     null: false, limit: 32
      t.uuid :subject_id,     null: false, index: true, foreign_key: true
      t.uuid :user_id,        null: false, index: true, foreign_key: true
      t.timestamps
    end

  end
end
