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

ActiveRecord::Schema.define(version: 2020_08_27_105505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "adminslots", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.datetime "slot", null: false
    t.boolean "booked"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "facts"
    t.string "facts_table"
    t.string "facility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "animation"
    t.boolean "humanities"
    t.boolean "law"
    t.boolean "mascom"
    t.boolean "medical"
    t.boolean "science"
    t.boolean "hospitality"
    t.boolean "architecture"
    t.boolean "arts"
    t.boolean "commerce"
    t.boolean "engineering"
    t.boolean "design"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "table_id"
    t.string "degree"
    t.string "name"
    t.string "facts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "defaultparams", force: :cascade do |t|
    t.string "typeplan"
    t.integer "price"
    t.integer "numsession"
    t.string "line1"
    t.string "line2"
    t.string "line3"
    t.string "line4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "number"
    t.string "dob"
    t.string "gender"
    t.string "background"
    t.string "interest"
    t.string "fathername"
    t.string "fathercontact"
    t.string "mothername"
    t.string "mothercontact"
    t.boolean "subscription"
    t.string "subtype"
    t.integer "slotsleft"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "verified"
    t.string "verification_token"
  end

end
