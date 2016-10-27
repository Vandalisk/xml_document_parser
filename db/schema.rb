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

ActiveRecord::Schema.define(version: 20161027145953) do

  create_table "purchases", force: :cascade do |t|
    t.string   "guid"
    t.datetime "create_date_time"
    t.bigint   "registration_number"
    t.string   "name"
    t.integer  "customer_id"
    t.integer  "purchase_method_code"
    t.string   "purchase_code_name"
    t.integer  "placer_id"
    t.integer  "contact"
    t.datetime "publication_date_time"
    t.datetime "modification_date"
    t.integer  "documentationDelivery"
    t.string   "status"
    t.integer  "version"
    t.integer  "save_user_id"
    t.integer  "nonelectronic_place_info"
    t.text     "examination_place"
    t.datetime "examination_date_time"
    t.datetime "submission_close_date_time"
    t.datetime "publication_planned_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["contact"], name: "index_purchases_on_contact"
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["documentationDelivery"], name: "index_purchases_on_documentationDelivery"
    t.index ["placer_id"], name: "index_purchases_on_placer_id"
  end

end
