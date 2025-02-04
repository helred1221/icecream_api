class CreateSaleProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_products do |t|
      t.integer :rate, null: false, foreign_key: true
      t.integer :quantity
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
