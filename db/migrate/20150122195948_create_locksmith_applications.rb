class CreateLocksmithApplications < ActiveRecord::Migration
  def change
    create_table :locksmith_applications do |t|
      t.string :name, limit: 30
      t.string :key
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :locksmith_applications, :users
  end
end
