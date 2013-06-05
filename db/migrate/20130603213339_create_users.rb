class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false

      t.string :access_token, null: false
      t.string :secret_token, null: false
      t.timestamps
    end

    add_index :users, :name, :unique => true
  end
end
