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

ActiveRecord::Schema.define(version: 20140211081449) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "advertisings", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "audience"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisings", ["conference_id"], name: "index_advertisings_on_conference_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "entry"
    t.string   "file"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conference_id"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["conference_id"], name: "index_articles_on_conference_id"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "icon"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

  create_table "conference_translations", force: true do |t|
    t.integer  "conference_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
  end

  add_index "conference_translations", ["conference_id"], name: "index_conference_translations_on_conference_id"
  add_index "conference_translations", ["locale"], name: "index_conference_translations_on_locale"

  create_table "conferences", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

end
