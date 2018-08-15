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

ActiveRecord::Schema.define(version: 2018_08_15_220613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.decimal "price"
    t.bigint "tutor_id"
    t.index ["tutor_id"], name: "index_categories_on_tutor_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.date "date"
    t.time "time"
    t.string "location"
    t.integer "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_lessons_on_category_id"
    t.index ["student_id"], name: "index_lessons_on_student_id"
    t.index ["tutor_id"], name: "index_lessons_on_tutor_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "name"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "student_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_orders_on_lesson_id"
    t.index ["student_id"], name: "index_orders_on_student_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "tutor_id"
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_reviews_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.decimal "balance"
    t.string "card"
    t.string "phone"
    t.text "bio"
    t.date "birthdate"
    t.integer "status"
    t.boolean "pro"
    t.integer "like"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image_fb"
    t.string "photo"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tutors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.decimal "balance"
    t.string "card"
    t.string "phone"
    t.text "bio"
    t.date "birthdate"
    t.integer "status"
    t.boolean "pro"
    t.integer "like"
    t.integer "level"
    t.string "degree"
    t.string "institution"
    t.decimal "desirability"
    t.text "specialties"
    t.text "qualifications"
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image_fb"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "tutors"
  add_foreign_key "lessons", "categories"
  add_foreign_key "lessons", "students"
  add_foreign_key "lessons", "tutors"
  add_foreign_key "orders", "lessons"
  add_foreign_key "orders", "students"
  add_foreign_key "reviews", "tutors"
end
