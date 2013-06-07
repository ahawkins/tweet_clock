class TweetSupport < ActiveRecord::Migration
  def up
    add_column :tweets, :sent, :boolean, default: false
    add_column :tweets, :posted, :string
    add_column :tweets, :time, :datetime

    add_index :tweets, [:time, :sent]
  end

  def down
    remove_column :tweets, :sent
    remove_column :tweets, :posted
    remove_column :tweets, :time
  end
end
