class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users, id: :uuid do |t|
      t.string :email,            null: false, index: true, unique: true
      t.string :password_digest,  null: false
      t.timestamps
    end

  end
end
