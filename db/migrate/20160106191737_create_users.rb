# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string  :name,  null: false, limit: 64
      t.string  :email, null: false, limit: 64
    end

    add_index :users, :email, unique: true
  end
end
