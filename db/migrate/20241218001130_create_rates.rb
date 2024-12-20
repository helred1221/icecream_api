class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.integer :star
      t.string :comment

      t.timestamps
    end
  end
end
