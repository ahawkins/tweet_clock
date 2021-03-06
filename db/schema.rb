# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130612173140) do

  create_table "tweets", :force => true do |t|
    t.string   "text"
    t.text     "times"
    t.integer  "user_id",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "sent",       :default => false
    t.string   "posted"
    t.datetime "time"
  end

  add_index "tweets", ["time", "sent"], :name => "index_tweets_on_time_and_sent"

  create_table "users", :force => true do |t|
    t.string   "provider",                    :null => false
    t.string   "uid",                         :null => false
    t.string   "name",                        :null => false
    t.string   "access_token",                :null => false
    t.string   "secret_token",                :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "settings",     :limit => 255
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
