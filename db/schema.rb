# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_144751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "number"
    t.string "street"
    t.string "additional"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "organisation_id"
    t.string "title"
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_phone"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "volunteers_needed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organisation_id"], name: "index_missions_on_organisation_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.string "name"
    t.string "registration_number"
    t.date "registration_date"
    t.text "description"
    t.boolean "confirmed"
    t.bigint "tagable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_organisations_on_activity_id"
    t.index ["tagable_id"], name: "index_organisations_on_tagable_id"
    t.index ["user_id"], name: "index_organisations_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mission_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_participations_on_mission_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "address_id"
    t.string "first_name"
    t.string "last_name"
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin"
    t.string "phone_number"
    t.date "date_of_birth"
    t.boolean "organisation_admin"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
