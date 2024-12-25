class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :gender
      t.string :email
      t.string :password
      t.string :role
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
