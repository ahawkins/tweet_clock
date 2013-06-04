class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.text :times
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
