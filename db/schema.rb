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

ActiveRecord::Schema.define(version: 20161208193258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "job_titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicinal_ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "description"
    t.integer  "provider_id"
    t.integer  "sale_price"
    t.integer  "purchase_price"
    t.string   "exempt"
    t.integer  "commission"
    t.integer  "medicinal_ingredient_id"
    t.integer  "dose_id"
    t.string   "be"
    t.string   "isp"
    t.integer  "category_id"
    t.integer  "discount"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",             default: 0,     null: false
    t.string   "price_currency",          default: "USD", null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["dose_id"], name: "index_products_on_dose_id", using: :btree
    t.index ["medicinal_ingredient_id"], name: "index_products_on_medicinal_ingredient_id", using: :btree
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

  create_table "transactions", force: :cascade do |t|
    t.string   "kind"
    t.datetime "date"
    t.integer  "net_amount"
    t.float    "iva"
    t.integer  "discount"
    t.integer  "total_amount"
    t.string   "client_rut"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "rut",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "description"
    t.integer  "job_title_id"
    t.index ["job_title_id"], name: "index_users_on_job_title_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["rut"], name: "index_users_on_rut", unique: true, using: :btree
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "doses"
  add_foreign_key "products", "medicinal_ingredients"
  add_foreign_key "products", "providers"
  add_foreign_key "quotations", "checkouts"
  add_foreign_key "users", "job_titles"
end
