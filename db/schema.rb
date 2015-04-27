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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150426155110) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "members_runs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members_runs", ["run_id"], name: "index_members_runs_on_run_id"
  add_index "members_runs", ["user_id"], name: "index_members_runs_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "subscription_id"
    t.decimal  "amount_paid"
    t.datetime "date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_users", force: :cascade do |t|
    t.integer "route_id"
    t.integer "user_id"
  end

  create_table "runs", force: :cascade do |t|
    t.integer  "route_id"
    t.datetime "date"
    t.integer  "time_taken"
    t.string   "am_pm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "cell_phone"
    t.string   "landline"
    t.integer  "route_id"
    t.integer  "visit_sequence"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "qty"
    t.integer  "group_id"
    t.datetime "last_invoice_sent"
    t.datetime "renewal_due_date"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "run_id"
    t.integer  "subscription_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email"
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.boolean  "can_view_routes"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell_phone"
    t.string   "landline"
    t.boolean  "is_active"
    t.string   "vehicle"
    t.integer  "group_id"
    t.integer  "route_id"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
