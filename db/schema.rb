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

ActiveRecord::Schema.define(version: 20150317132604) do

  create_table "apply_records", force: :cascade do |t|
    t.string   "personname"
    t.string   "personcategory"
    t.string   "item"
    t.string   "artname"
    t.string   "artcategory"
    t.string   "state"
    t.string   "checkopinion"
    t.datetime "intime"
    t.datetime "sampletime"
    t.datetime "returntime"
    t.datetime "outtime"
    t.datetime "printtime"
    t.datetime "issuetime"
    t.string   "paid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "user"
    t.string   "image"
    t.string   "macroimage"
    t.string   "microimage"
    t.string   "qrimage"
    t.string   "dingdanhao"
    t.string   "itemsave"
    t.string   "sample"
    t.string   "issue"
    t.string   "isprint"
    t.string   "isissue"
    t.string   "state1"
    t.text     "advice"
    t.string   "idtype"
    t.string   "idnumber"
    t.string   "idimage"
    t.text     "beianadvice"
    t.time     "shenqingtime"
  end

  create_table "art_works", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "place"
    t.string   "author"
    t.string   "image"
    t.text     "describe"
    t.integer  "apply_record_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "macroimage"
    t.string   "microimage_a"
    t.string   "microimage_b"
    t.string   "microimage_c"
    t.string   "microimage_d"
    t.string   "QRimage"
  end

  add_index "art_works", ["apply_record_id"], name: "index_art_works_on_apply_record_id"

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "touser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tousername"
    t.boolean  "flag"
    t.boolean  "mark"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
    t.string   "usercategory"
    t.string   "phonenumber"
    t.string   "job"
    t.string   "realname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
