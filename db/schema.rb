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

ActiveRecord::Schema[7.0].define(version: 2023_08_10_092130) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "asset_stuffs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "status"
    t.datetime "assign_at"
    t.datetime "return_at"
    t.bigint "company_asset_id", null: false
    t.bigint "stuff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_asset_id"], name: "index_asset_stuffs_on_company_asset_id"
    t.index ["stuff_id"], name: "index_asset_stuffs_on_stuff_id"
  end

  create_table "asset_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "product_catagory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "company_assets", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "product_address"
    t.string "details"
    t.bigint "asset_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
    t.index ["asset_type_id"], name: "index_company_assets_on_asset_type_id"
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "line_items", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "uint_price"
    t.integer "quantity"
    t.integer "total_price"
    t.bigint "product_id", null: false
    t.bigint "purchase_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
    t.index ["purchase_order_id"], name: "index_line_items_on_purchase_order_id"
    t.index ["supplier_id"], name: "index_line_items_on_supplier_id"
  end

  create_table "positions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "post_name"
    t.string "description"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
    t.index ["department_id"], name: "index_positions_on_department_id"
  end

  create_table "product_suppliers", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "price"
    t.bigint "supplier_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_suppliers_on_product_id"
    t.index ["supplier_id"], name: "index_product_suppliers_on_supplier_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "purchase_orders", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stuff_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stuffs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "role_id"
    t.string "name"
    t.string "address"
    t.string "blood_group"
    t.bigint "position_id"
    t.string "phone_number"
    t.datetime "delete_at"
    t.index ["email"], name: "index_stuffs_on_email", unique: true
    t.index ["position_id"], name: "index_stuffs_on_position_id"
    t.index ["reset_password_token"], name: "index_stuffs_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_stuffs_on_role_id"
  end

  create_table "suppliers", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "asset_stuffs", "company_assets"
  add_foreign_key "asset_stuffs", "stuffs"
  add_foreign_key "company_assets", "asset_types"
  add_foreign_key "line_items", "products"
  add_foreign_key "line_items", "purchase_orders"
  add_foreign_key "line_items", "suppliers"
  add_foreign_key "positions", "departments"
  add_foreign_key "product_suppliers", "products"
  add_foreign_key "product_suppliers", "suppliers"
  add_foreign_key "stuffs", "positions"
  add_foreign_key "stuffs", "roles"
end
