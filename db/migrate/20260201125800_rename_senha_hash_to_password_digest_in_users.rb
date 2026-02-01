class RenameSenhaHashToPasswordDigestInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :senha_hash, :password_digest
  end
end