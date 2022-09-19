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

ActiveRecord::Schema[7.0].define(version: 2022_09_16_100609) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "activitable_type", null: false
    t.integer "activitable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "action", default: 0, null: false
    t.index ["activitable_type", "activitable_id"], name: "index_activities_on_activitable"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "band"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "music_style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "basket_products", force: :cascade do |t|
    t.integer "number_products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.integer "basket_id", null: false
    t.index ["basket_id"], name: "index_basket_products_on_basket_id"
    t.index ["product_id"], name: "index_basket_products_on_product_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state"
    t.integer "user_id"
    t.index ["shop_id"], name: "index_baskets_on_shop_id"
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "user_id", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fitnesses", force: :cascade do |t|
    t.text "sex"
    t.string "weight"
    t.string "growth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurement_values", force: :cascade do |t|
    t.integer "measurement_id", null: false
    t.float "value"
    t.time "measurement_time", precision: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measurement_id"], name: "index_measurement_values_on_measurement_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "upload_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "upload_id"], name: "index_measurements_on_name_and_upload_id", unique: true
    t.index ["upload_id"], name: "index_measurements_on_upload_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "shop_products", force: :cascade do |t|
    t.decimal "price", precision: 7, scale: 2
    t.integer "inventory_state"
    t.integer "product_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shop_products_on_product_id"
    t.index ["shop_id"], name: "index_shop_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.text "description"
    t.string "adress"
    t.string "phone"
    t.integer "workers_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "email", default: "", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "users"
  add_foreign_key "albums", "artists"
  add_foreign_key "articles", "users"
  add_foreign_key "basket_products", "baskets"
  add_foreign_key "basket_products", "products"
  add_foreign_key "baskets", "shops"
  add_foreign_key "baskets", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "measurement_values", "measurements"
  add_foreign_key "measurements", "uploads"
  add_foreign_key "products", "categories"
  add_foreign_key "shop_products", "products"
  add_foreign_key "shop_products", "shops"
  add_foreign_key "songs", "albums"
end
