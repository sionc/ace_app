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

ActiveRecord::Schema.define(:version => 20121012190747) do

  create_table "data_item_types", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.float    "default_value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "data_item_values", :force => true do |t|
    t.integer  "data_item_id"
    t.float    "current_value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "statistics_entry_id"
  end

  create_table "data_items", :force => true do |t|
    t.integer  "data_item_type_id"
    t.integer  "statistics_source_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "comment"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "process_managers", :force => true do |t|
    t.string   "workspace_path"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "statistics_entries", :force => true do |t|
    t.integer  "process_manager_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "timestamp"
  end

  create_table "statistics_source_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statistics_sources", :force => true do |t|
    t.integer  "process_manager_id"
    t.integer  "statistics_source_type_id"
    t.string   "source_path"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "tests", :force => true do |t|
    t.integer  "data"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
