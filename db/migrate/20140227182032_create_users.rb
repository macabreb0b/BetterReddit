class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :username, null: false
      t.string :token, null: false

      t.timestamps
    end

    add_index :users, :username, :unique => true
  end
end
