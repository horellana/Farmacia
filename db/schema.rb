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

ActiveRecord::Schema.define(version: 20170317192851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "box_movements", force: :cascade do |t|
    t.integer  "box_id"
    t.integer  "user_id"
    t.datetime "start_date"
    t.integer  "start_amount"
    t.datetime "end_date"
    t.integer  "end_amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["box_id"], name: "index_box_movements_on_box_id", using: :btree
    t.index ["user_id"], name: "index_box_movements_on_user_id", using: :btree
  end

  create_table "boxes", force: :cascade do |t|
    t.boolean  "active"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    t.index ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "transaction_id"
    t.index ["transaction_id"], name: "index_carts_on_transaction_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "checkouts", force: :cascade do |t|
    t.bigint   "ticket"
    t.boolean  "start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "rut"
    t.string   "name"
    t.string   "lastname"
    t.string   "gender"
    t.datetime "birth"
    t.string   "email"
    t.string   "address"
    t.string   "kind"
    t.string   "business_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "doses", force: :cascade do |t|
    t.integer  "kind"
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "product_id"
    t.integer  "stock"
    t.integer  "minimum_stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["office_id"], name: "index_inventories_on_office_id", using: :btree
    t.index ["product_id"], name: "index_inventories_on_product_id", using: :btree
  end

  create_table "job_titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
  end

  create_table "medicinal_ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.integer  "phone"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address"
    t.datetime "hour_in"
    t.datetime "hour_out"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "presentation_details", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["presentation_id"], name: "index_presentation_details_on_presentation_id", using: :btree
    t.index ["product_id"], name: "index_presentation_details_on_product_id", using: :btree
  end

  create_table "presentations", force: :cascade do |t|
    t.string  "name"
    t.integer "product_id"
    t.index ["product_id"], name: "index_presentations_on_product_id", using: :btree
  end

  create_table "principle_details", force: :cascade do |t|
    t.integer "principle_id"
    t.integer "product_id"
    t.index ["principle_id"], name: "index_principle_details_on_principle_id", using: :btree
    t.index ["product_id"], name: "index_principle_details_on_product_id", using: :btree
  end

  create_table "principles", force: :cascade do |t|
    t.string "name"
  end

  create_table "products", force: :cascade do |t|
    t.string   "description"
    t.integer  "provider_id"
    t.integer  "sale_price"
    t.integer  "purchase_price"
    t.integer  "medicinal_ingredient_id"
    t.integer  "dose_id"
    t.string   "be"
    t.string   "isp"
    t.integer  "category_id"
    t.integer  "discount"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.integer  "stock"
    t.integer  "minimum_stock"
    t.string   "code"
    t.integer  "presentation_id"
    t.integer  "laboratory_id"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["dose_id"], name: "index_products_on_dose_id", using: :btree
    t.index ["laboratory_id"], name: "index_products_on_laboratory_id", using: :btree
    t.index ["medicinal_ingredient_id"], name: "index_products_on_medicinal_ingredient_id", using: :btree
    t.index ["presentation_id"], name: "index_products_on_presentation_id", using: :btree
    t.index ["provider_id"], name: "index_products_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "rut"
    t.string   "name"
    t.string   "business_name"
    t.string   "draft"
    t.string   "address"
    t.string   "phone_one"
    t.string   "phone_two"
    t.string   "email"
    t.string   "web"
    t.string   "kind"
    t.string   "observation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.integer  "net_amount"
    t.float    "iva"
    t.integer  "total"
    t.string   "transaction_kind"
    t.integer  "checkout_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["checkout_id"], name: "index_quotations_on_checkout_id", using: :btree
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_details", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "unit_price"
    t.integer  "net_price"
    t.string   "devolution"
    t.integer  "user_id"
    t.integer  "discount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["product_id"], name: "index_transaction_details_on_product_id", using: :btree
    t.index ["transaction_id"], name: "index_transaction_details_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_transaction_details_on_user_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "kind"
    t.datetime "date"
    t.integer  "net_amount"
    t.float    "iva"
    t.integer  "discount"
    t.integer  "total_amount"
    t.string   "client_rut"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "box_movement_id"
    t.integer  "payed_amount"
    t.index ["box_movement_id"], name: "index_transactions_on_box_movement_id", using: :btree
    t.index ["cart_id"], name: "index_transactions_on_cart_id", using: :btree
    t.index ["client_id"], name: "index_transactions_on_client_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "rut",                    default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "description"
    t.integer  "job_title_id"
    t.string   "name"
    t.integer  "office_id"
    t.boolean  "admin",                  default: false
    t.index ["job_title_id"], name: "index_users_on_job_title_id", using: :btree
    t.index ["office_id"], name: "index_users_on_office_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["rut"], name: "index_users_on_rut", unique: true, using: :btree
  end

  add_foreign_key "box_movements", "boxes"
  add_foreign_key "box_movements", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "transactions"
  add_foreign_key "inventories", "offices"
  add_foreign_key "inventories", "products"
  add_foreign_key "presentation_details", "presentations"
  add_foreign_key "presentation_details", "products"
  add_foreign_key "presentations", "products"
  add_foreign_key "principle_details", "principles"
  add_foreign_key "principle_details", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "doses"
  add_foreign_key "products", "laboratories"
  add_foreign_key "products", "medicinal_ingredients"
  add_foreign_key "products", "presentations"
  add_foreign_key "products", "providers"
  add_foreign_key "quotations", "checkouts"
  add_foreign_key "transaction_details", "products"
  add_foreign_key "transaction_details", "transactions"
  add_foreign_key "transaction_details", "users"
  add_foreign_key "transactions", "box_movements"
  add_foreign_key "transactions", "carts"
  add_foreign_key "transactions", "clients"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "job_titles"
  add_foreign_key "users", "offices"
end
