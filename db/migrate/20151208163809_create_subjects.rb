# frozen_string_literal: true
class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects, id: :uuid do |t|
      t.string  :code,    null: false, limit: 16
      t.string  :symbol,  null: false, limit: 32
      t.string  :name,    null: false, limit: 32
      t.string  :unit,    null: false, limit: 16
      t.uuid    :user_id, null: false, index: true, foreign_key: true
      t.timestamps
    end

    add_index :subjects, :code, unique: true
  end
end
