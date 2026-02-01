class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :senha_hash, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
