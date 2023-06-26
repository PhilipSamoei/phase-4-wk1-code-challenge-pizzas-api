class CreateRestaurantPizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_pizzas do |t|
      t.references :restaurant_id, null: false, foreign_key: true
      t.references :pizza_id, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
