class AddIndexToApplicationsKey < ActiveRecord::Migration
  def change
    add_index :locksmith_applications, :key, unique: true
  end
end
