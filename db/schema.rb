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

ActiveRecord::Schema.define(version: 20160702133640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.date     "date_register"
    t.date     "date_expiration"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "authorizer_id"
  end

  add_index "authorizations", ["authorizer_id"], name: "index_authorizations_on_authorizer_id", using: :btree
  add_index "authorizations", ["room_id"], name: "index_authorizations_on_room_id", using: :btree
  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "input_register"
    t.datetime "output_register"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "loans", ["room_id"], name: "index_loans_on_room_id", using: :btree
  add_index "loans", ["user_id"], name: "index_loans_on_user_id", using: :btree

  create_table "operators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "operators", ["email"], name: "index_operators_on_email", unique: true, using: :btree
  add_index "operators", ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true, using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "matricula"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "servidor",        default: false
    t.boolean  "admin",           default: false
    t.string   "password_digest"
  end

end
