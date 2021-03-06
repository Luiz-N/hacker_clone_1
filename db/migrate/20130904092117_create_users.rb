class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email 
      t.string :password

      t.timestamps
    end

    add_index :users, [:email, :username], :unique => true
  end
end
