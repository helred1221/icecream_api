class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.timestamp :sale_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
