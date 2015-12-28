class CreateSubjects < ActiveRecord::Migration
  def change

    create_table :subjects, id: :uuid do |t|
      t.string :code,   null: false, limit: 16,index: true, unique: { unique: true }
      t.string :name,   null: false, limit: 32
      t.string :unit,   null: false, limit: 16
      t.uuid :user_id,  null: false, index: true, foreign_key: true
      t.timestamps
    end

  end
end
