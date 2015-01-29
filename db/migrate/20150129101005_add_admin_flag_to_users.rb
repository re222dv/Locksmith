class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :locksmith_users, :admin, :boolean
  end
end
