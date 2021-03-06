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

ActiveRecord::Schema.define(version: 2019_07_29_211253) do

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "lifecycle"
    t.string "name"
    t.string "description"
    t.integer "funding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_event_verifications", force: :cascade do |t|
    t.integer "verifiable_task_event_id"
    t.integer "user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_task_event_verifications_on_user_id"
    t.index ["verifiable_task_event_id"], name: "index_task_event_verifications_on_verifiable_task_event_id"
  end

  create_table "task_fundings", force: :cascade do |t|
    t.string "token_address"
    t.string "token_symbol"
    t.string "token_name"
    t.decimal "amount"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_fundings_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "done", default: false
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "eth_addr"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verifiable_task_events", force: :cascade do |t|
    t.string "attachment_link_text"
    t.integer "task_id"
    t.integer "event_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type_id"], name: "index_verifiable_task_events_on_event_type_id"
    t.index ["task_id"], name: "index_verifiable_task_events_on_task_id"
  end

end
