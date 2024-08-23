# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_23_160059) do
  create_table "blockchain_records", force: :cascade do |t|
    t.integer "evaluation_id", null: false
    t.string "tx_id"
    t.integer "block_number"
    t.string "status"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_blockchain_records_on_evaluation_id"
    t.index ["organization_id"], name: "index_blockchain_records_on_organization_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_categories_on_organization_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "evaluatee_id", null: false
    t.integer "category_id", null: false
    t.integer "score"
    t.text "comments"
    t.text "encrypted_data"
    t.text "zk_proof"
    t.string "blockchain_tx_id"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_evaluations_on_category_id"
    t.index ["evaluatee_id"], name: "index_evaluations_on_evaluatee_id"
    t.index ["organization_id"], name: "index_evaluations_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "hashed_id"
    t.integer "role", default: 0, null: false
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blockchain_records", "evaluations"
  add_foreign_key "blockchain_records", "organizations"
  add_foreign_key "categories", "organizations"
  add_foreign_key "evaluations", "categories"
  add_foreign_key "evaluations", "organizations"
  add_foreign_key "evaluations", "users", column: "evaluatee_id"
  add_foreign_key "users", "organizations"
end
