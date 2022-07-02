class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :food
      t.string :measurement_unit
      t.integer :unit_price
      t.timestamps
    end
  end
end
