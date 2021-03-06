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

ActiveRecord::Schema.define(version: 20150503031813) do

  create_table "logs", force: :cascade do |t|
    t.integer  "subtask_id"
    t.datetime "start"
    t.datetime "stop"
  end

  add_index "logs", ["subtask_id"], name: "index_logs_on_subtask_id"

  create_table "subtasks", force: :cascade do |t|
    t.string   "name"
    t.boolean  "complete"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subtasks", ["task_id"], name: "index_subtasks_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "state",        default: "to_do"
    t.text     "content_html"
    t.integer  "priority"
    t.text     "descricao"
    t.string   "url"
    t.boolean  "public",       default: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "", null: false
    t.string   "nome",                   default: "", null: false
    t.string   "sobrenome"
    t.string   "apelido"
    t.text     "bio"
    t.string   "celular"
    t.string   "funcacao"
    t.string   "formacao"
    t.date     "datanascimento"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "whatsapp"
    t.string   "setor"
    t.string   "ramal"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "tasks_count",            default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
