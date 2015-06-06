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

ActiveRecord::Schema.define(version: 20150602085817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["city_id"], name: "index_areas_on_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "iso_code"
  end

  create_table "diagnostic_facilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostic_facilities_hospitals", id: false, force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "diagnostic_facility_id"
  end

  add_index "diagnostic_facilities_hospitals", ["hospital_id", "diagnostic_facility_id"], name: "hospital_diagnostic_facility_index", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.string   "full_name"
    t.string   "practice_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "experience"
    t.boolean  "verified"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "specialization_id"
    t.integer  "qualification_id"
    t.string   "avatar"
  end

  add_index "doctors", ["qualification_id"], name: "index_doctors_on_qualification_id", using: :btree
  add_index "doctors", ["specialization_id"], name: "index_doctors_on_specialization_id", using: :btree

  create_table "hospital_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospital_categories_hospitals", id: false, force: :cascade do |t|
    t.integer "hospital_id",          null: false
    t.integer "hospital_category_id", null: false
  end

  add_index "hospital_categories_hospitals", ["hospital_id", "hospital_category_id"], name: "hospital_categories_hospitals_index", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.integer  "area_id"
    t.text     "address"
    t.string   "phone"
    t.integer  "bed_capacity"
    t.decimal  "appointment_charge"
    t.boolean  "aarogyasri",         default: false
    t.boolean  "verified",           default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.time     "opens_at"
    t.time     "closes_at"
    t.boolean  "full_time"
  end

  add_index "hospitals", ["area_id"], name: "index_hospitals_on_area_id", using: :btree

  create_table "hospitals_medical_equipments", id: false, force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "medical_equipment_id"
  end

  add_index "hospitals_medical_equipments", ["hospital_id", "medical_equipment_id"], name: "hospitals_medical_equipments_index", using: :btree

  create_table "hospitals_other_facilities", id: false, force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "other_facility_id"
  end

  add_index "hospitals_other_facilities", ["hospital_id", "other_facility_id"], name: "hospital_:other_facility_index", using: :btree

  create_table "hospitals_specialities", id: false, force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "speciality_id"
  end

  add_index "hospitals_specialities", ["hospital_id", "speciality_id"], name: "index_hospitals_specialities_on_hospital_id_and_speciality_id", using: :btree

  create_table "medical_equipments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_facilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "doctor_id"
    t.time     "sunday_morning_from"
    t.time     "sunday_morning_to"
    t.time     "sunday_noon_from"
    t.time     "sunday_noon_to"
    t.time     "monday_morning_from"
    t.time     "monday_morning_to"
    t.time     "monday_noon_from"
    t.time     "monday_noon_to"
    t.time     "tuesday_morning_from"
    t.time     "tuesday_morning_to"
    t.time     "tuesday_noon_from"
    t.time     "tuesday_noon_to"
    t.time     "wednesday_morning_from"
    t.time     "wednesday_morning_to"
    t.time     "wednesday_noon_from"
    t.time     "wednesday_noon_to"
    t.time     "thursday_morning_from"
    t.time     "thursday_morning_to"
    t.time     "thursday_noon_from"
    t.time     "thursday_noon_to"
    t.time     "friday_morning_from"
    t.time     "friday_morning_to"
    t.time     "friday_noon_from"
    t.time     "friday_noon_to"
    t.time     "saturday_morning_from"
    t.time     "saturday_morning_to"
    t.time     "saturday_noon_from"
    t.time     "saturday_noon_to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "schedules", ["doctor_id"], name: "index_schedules_on_doctor_id", using: :btree
  add_index "schedules", ["hospital_id", "doctor_id"], name: "index_schedules_on_hospital_id_and_doctor_id", unique: true, using: :btree
  add_index "schedules", ["hospital_id"], name: "index_schedules_on_hospital_id", using: :btree

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "description"
    t.integer  "treatment_category_id"
  end

  add_index "specialities", ["treatment_category_id"], name: "index_specialities_on_treatment_category_id", using: :btree

  create_table "specializations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "alias"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "treatment_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "areas", "cities"
  add_foreign_key "cities", "states"
  add_foreign_key "hospitals", "areas"
  add_foreign_key "schedules", "doctors"
  add_foreign_key "schedules", "hospitals"
  add_foreign_key "specialities", "treatment_categories"
  add_foreign_key "states", "countries"
end
