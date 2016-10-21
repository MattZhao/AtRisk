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

ActiveRecord::Schema.define(version: 20161020234005) do

  create_table "forms", force: :cascade do |t|
    t.string   "id_user"
    t.string   "form_type"
    t.string   "photo_path"
    t.string   "name"
    t.string   "address"
    t.boolean  "live_alone"
    t.date     "birth_date"
    t.string   "nickname"
    t.string   "sex"
    t.string   "height"
    t.string   "weight"
    t.string   "color_eye"
    t.string   "color_hair"
    t.text     "body_marks"
    t.text     "other_medical_conds"
    t.text     "meds_needed"
    t.integer  "phone_number"
    t.string   "phone_company"
    t.string   "ec1_name"
    t.string   "ec1_address"
    t.integer  "ec1_phone_home"
    t.integer  "ec1_phone_work"
    t.integer  "ec1_phone_cell"
    t.string   "ec2_name"
    t.string   "ec2_address"
    t.integer  "ec2_phone_home"
    t.integer  "ec2_phone_work"
    t.integer  "ec2_phone_cell"
    t.string   "preferred_language"
    t.text     "info_id"
    t.text     "info_tracking"
    t.boolean  "has_alzheimers"
    t.boolean  "has_dementia"
    t.boolean  "has_down_syndrome"
    t.boolean  "has_other_disorders"
    t.text     "other_disorders"
    t.text     "sensory_dietary_issues"
    t.text     "calming_methods"
    t.text     "info_other_first_resp"
    t.text     "attractions_locations"
    t.text     "atypical_behaviors"
    t.text     "favorite_topics"
    t.text     "communication_method_1"
    t.text     "communication_method_2"
    t.boolean  "form_activeness"
    t.boolean  "dummy_boolean"
    t.string   "dummy_string"
    t.text     "dummy_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
