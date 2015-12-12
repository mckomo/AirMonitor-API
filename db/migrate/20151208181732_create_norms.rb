class CreateNorms < ActiveRecord::Migration
  def change

    create_table :norms, id: false do |t|
      t.string :subject_code, null: false, index: true, foreign_key: true
      t.float :value,         null: false
      t.integer :level,       null: false, index: true
      t.string :interval,     null: false, limit: 32
      t.timestamps
    end

  end
end
