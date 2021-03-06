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

ActiveRecord::Schema.define(version: 2022_03_02_171941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "colour"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_lessons_on_student_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "practiseds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "student_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_practiseds_on_student_id"
    t.index ["topic_id"], name: "index_practiseds_on_topic_id"
    t.index ["user_id"], name: "index_practiseds_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name_wechat"
    t.string "name_en"
    t.text "onboarding"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone"
    t.string "app"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.text "part_1"
    t.text "part_2_hints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "part_3"
    t.string "part_2"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_topics_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "timezone"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lessons", "students"
  add_foreign_key "lessons", "users"
  add_foreign_key "practiseds", "students"
  add_foreign_key "practiseds", "topics"
  add_foreign_key "practiseds", "users"
  add_foreign_key "topics", "categories"
end
