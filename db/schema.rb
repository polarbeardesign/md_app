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

ActiveRecord::Schema.define(:version => 20160510202653) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "event_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "event_type_id"
    t.string   "title"
    t.integer  "event_status_id"
    t.integer  "location_id"
    t.string   "event_url"
    t.string   "contact_info"
    t.text     "details"
    t.integer  "entered_by"
    t.string   "graphic_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["event_status_id"], :name => "index_events_on_event_status_id"
  add_index "events", ["event_type_id"], :name => "index_events_on_event_type_id"
  add_index "events", ["location_id"], :name => "index_events_on_location_id"

  create_table "grants", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grants", ["right_id"], :name => "index_grants_on_right_id"
  add_index "grants", ["role_id"], :name => "index_grants_on_role_id"

  create_table "locations", :force => true do |t|
    t.string   "short_name"
    t.string   "location_name"
    t.string   "icao_identifier"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "caf_col_no"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.boolean  "active"
    t.date     "caf_join_date"
    t.string   "ec_name"
    t.string   "ec_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights", :force => true do |t|
    t.string   "resource"
    t.string   "operation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
