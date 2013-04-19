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

ActiveRecord::Schema.define(:version => 20130418222016) do

  create_table "flms_blocks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flms_blocks_pages", :force => true do |t|
    t.integer  "block_id"
    t.integer  "page_id"
    t.integer  "ordering"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flms_blocks_pages", ["block_id"], :name => "index_flms_blocks_pages_on_block_id"
  add_index "flms_blocks_pages", ["page_id"], :name => "index_flms_blocks_pages_on_page_id"

  create_table "flms_keyframes", :force => true do |t|
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "layer_id"
    t.string   "type"
    t.integer  "scroll_start"
    t.integer  "scroll_duration"
    t.float    "width"
    t.float    "height"
    t.float    "position_x"
    t.float    "position_y"
    t.float    "opacity"
    t.float    "scale"
    t.float    "blur"
    t.float    "margin_left",     :default => 0.0
    t.float    "margin_top",      :default => 0.0
  end

  create_table "flms_layers", :force => true do |t|
    t.string   "name"
    t.integer  "block_id"
    t.string   "type"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "image"
    t.string   "text"
    t.float    "font_size"
    t.string   "color"
    t.float    "width"
    t.float    "height"
    t.boolean  "dom_remove", :default => true
  end

  add_index "flms_layers", ["block_id"], :name => "index_flms_layers_on_block_id"

  create_table "flms_pages", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flms_pages", ["url"], :name => "index_flms_pages_on_url"

  create_table "flms_users", :force => true do |t|
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
  end

  add_index "flms_users", ["email"], :name => "index_flms_users_on_email", :unique => true
  add_index "flms_users", ["reset_password_token"], :name => "index_flms_users_on_reset_password_token", :unique => true

end
