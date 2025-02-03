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

ActiveRecord::Schema[7.0].define(version: 20_241_229_175_606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'street'
    t.integer 'house_number'
    t.string 'neighborhood'
    t.string 'city'
    t.string 'zip_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'tittle'
    t.string 'description'
    t.string 'brand'
    t.float 'value'
    t.integer 'size'
    t.integer 'quantity'
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_products_on_category_id'
  end

  create_table 'rates', force: :cascade do |t|
    t.integer 'star'
    t.string 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sale_products', force: :cascade do |t|
    t.integer 'rated'
    t.integer 'quantity'
    t.bigint 'sale_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_sale_products_on_product_id'
    t.index ['sale_id'], name: 'index_sale_products_on_sale_id'
  end

  create_table 'sales', force: :cascade do |t|
    t.integer 'amount'
    t.datetime 'sale_date', precision: nil
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_sales_on_user_id'
  end

  create_table 'user_rate_products', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'product_id', null: false
    t.bigint 'rate_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_user_rate_products_on_product_id'
    t.index ['rate_id'], name: 'index_user_rate_products_on_rate_id'
    t.index ['user_id'], name: 'index_user_rate_products_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.boolean 'gender'
    t.string 'email'
    t.string 'password'
    t.string 'role'
    t.bigint 'address_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address_id'], name: 'index_users_on_address_id'
  end

  add_foreign_key 'products', 'categories'
  add_foreign_key 'sale_products', 'products'
  add_foreign_key 'sale_products', 'sales'
  add_foreign_key 'sales', 'users'
  add_foreign_key 'user_rate_products', 'products'
  add_foreign_key 'user_rate_products', 'rates'
  add_foreign_key 'user_rate_products', 'users'
  add_foreign_key 'users', 'addresses'
end
