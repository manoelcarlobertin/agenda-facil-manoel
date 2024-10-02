ActiveRecord::Schema[7.2].define(version: 2024_10_02_165352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "indentifier", null: false
    t.string "name", limit: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["indentifier"], name: "index_categories_on_indentifier", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "description"
    t.datetime "started_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
  end

  add_foreign_key "events", "categories"
end
