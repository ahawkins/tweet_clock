class ChangeUsersSettingsToText < ActiveRecord::Migration
  def up
    change_column :users, :settings, :text
  end

  def down
    change_column :users, :settings, :string
  end
end
