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

ActiveRecord::Schema.define(version: 20161028084519) do

  create_table "attachments", force: :cascade do |t|
    t.string   "guid"
    t.datetime "create_date_time"
    t.string   "file_name"
    t.text     "description"
    t.string   "url"
    t.integer  "purchase_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["purchase_id"], name: "index_attachments_on_purchase_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "code"
    t.integer  "digital_code"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "documentation_deliveries", force: :cascade do |t|
    t.datetime "delivery_start_date_time"
    t.datetime "delivery_end_date_time"
    t.string   "place"
    t.text     "procedure"
    t.integer  "purchase_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["purchase_id"], name: "index_documentation_deliveries_on_purchase_id"
  end

  create_table "lot_items", force: :cascade do |t|
    t.string   "guid"
    t.integer  "ordinal_number"
    t.integer  "okdp_id"
    t.integer  "okved_id"
    t.integer  "okei_id"
    t.integer  "lot_id"
    t.bigint   "qty"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["lot_id"], name: "index_lot_items_on_lot_id"
    t.index ["okdp_id"], name: "index_lot_items_on_okdp_id"
    t.index ["okei_id"], name: "index_lot_items_on_okei_id"
    t.index ["okved_id"], name: "index_lot_items_on_okved_id"
  end

  create_table "lots", force: :cascade do |t|
    t.string   "guid"
    t.integer  "ordinal_number"
    t.string   "subject"
    t.integer  "currency_id"
    t.decimal  "initial_sum",    precision: 8, scale: 2
    t.string   "delivery_place"
    t.integer  "purchase_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["currency_id"], name: "index_lots_on_currency_id"
    t.index ["purchase_id"], name: "index_lots_on_purchase_id"
  end

  create_table "nonelectronic_place_infos", force: :cascade do |t|
    t.string   "summarizing_place"
    t.datetime "summarizing_date_time"
    t.integer  "purchase_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["purchase_id"], name: "index_nonelectronic_place_infos_on_purchase_id"
  end

  create_table "oks", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "full_name"
    t.string   "short_name"
    t.string   "inn"
    t.string   "kpp"
    t.string   "ogrn"
    t.string   "legal_address"
    t.string   "postal_address"
    t.string   "phone"
    t.string   "email"
    t.string   "okato"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "guid"
    t.datetime "create_date_time"
    t.integer  "registration_number",        limit: 8
    t.string   "name"
    t.integer  "purchase_method_code"
    t.string   "purchase_code_name"
    t.datetime "publication_date_time"
    t.datetime "modification_date"
    t.string   "status"
    t.integer  "version"
    t.integer  "save_user_id"
    t.text     "examination_place"
    t.datetime "examination_date_time"
    t.datetime "submission_close_date_time"
    t.datetime "publication_planned_date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

end
