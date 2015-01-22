class CreateLocksmithUsers < ActiveRecord::Migration
  def change
    create_table :locksmith_users do |t|
      t.string :name, limit: 30
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
