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

ActiveRecord::Schema.define(version: 20171005163549) do

  create_table "externs", force: :cascade do |t|
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_externs_on_login", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "groups_relations", force: :cascade do |t|
    t.integer "group_id"
    t.string "relationable_type"
    t.integer "relationable_id"
    t.integer "campus_id"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_groups_relations_on_campus_id"
    t.index ["group_id"], name: "index_groups_relations_on_group_id"
    t.index ["relationable_id"], name: "index_groups_relations_on_relationable_id"
    t.index ["relationable_type", "relationable_id"], name: "groups_relationable_polymorphic_association"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "permissions_relations", force: :cascade do |t|
    t.integer "permission_id"
    t.string "relationable_type"
    t.integer "relationable_id"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permissions_relations_on_permission_id"
    t.index ["relationable_id"], name: "index_permissions_relations_on_relationable_id"
    t.index ["relationable_type", "relationable_id"], name: "permissions_relationable_polymorphic_association"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
