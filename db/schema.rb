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

ActiveRecord::Schema.define(version: 20160322172616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false, index: {name: "index_users_on_email", unique: true}
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token",   index: {name: "index_users_on_reset_password_token", unique: true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "subtitle"
    t.text     "descriptiono"
    t.text     "contact_info"
    t.float    "estimated_finish_time"
    t.boolean  "is_published",          default: false
    t.integer  "owner_id",              index: {name: "fk__courses_owner_id"}, foreign_key: {references: "users", name: "fk_courses_owner_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "course_category_id",    index: {name: "index_courses_on_course_category_id"}, foreign_key: {references: "course_categories", name: "fk_courses_course_category_id", on_update: :no_action, on_delete: :no_action}
  end
  add_index "courses", ["owner_id"], name: "index_courses_on_owner_id"

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "course_id",   index: {name: "index_chapters_on_course_id"}, foreign_key: {references: "courses", name: "fk_rails_11d0c270dd", on_update: :no_action, on_delete: :no_action}
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "progress", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "chapter_id", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",       index: {name: "index_subscriptions_on_user_id"}, foreign_key: {references: "users", name: "fk_rails_933bdff476", on_update: :no_action, on_delete: :no_action}
    t.integer  "course_id",     index: {name: "index_subscriptions_on_course_id"}, foreign_key: {references: "courses", name: "fk_rails_22140e69f4", on_update: :no_action, on_delete: :no_action}
    t.datetime "subscribed_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
