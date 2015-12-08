class CreateNorms < ActiveRecord::Migration
  def change

    create_table :norms, id: false do |t|
      t.string :interval,     null: false, limit: 32
      t.float :value,         null: false
      t.string :subject_code, null: false, index: true, foreign_key: true
      t.datetime :created_at, null: false
    end

  end
end
