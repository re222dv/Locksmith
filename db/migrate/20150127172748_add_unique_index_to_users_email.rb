class AddUniqueIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :locksmith_users, :email, unique: true
  end
end
