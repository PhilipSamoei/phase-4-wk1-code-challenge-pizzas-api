require 'faker'

Pizza.destroy_all
Restaurant.destroy_all
RestaurantPizza.destroy_all
puts "Please wait to Seed..."



pizza_data = [
  { name: "Prosciutto", ingredients: ["Tomato sauce", "Mozzarella", "Prosciutto"], restaurant_id: 1 },
  { name: "Prosciutto e Funghi", ingredients: ["Tomato sauce", "Mozzarella", "Prosciutto", "Mushrooms"], restaurant_id: 2 },
  { name: "Pugliese", ingredients: ["Tomato sauce", "Mozzarella", "Onions"], restaurant_id: 3 },
  { name: "Quattro Formaggi", ingredients: ["Tomato sauce", "Mozzarella", "Gorgonzola Piccante", "Parmigiano Reggiano", "Pecorino"], restaurant_id: 3 },
  { name: "Quattro Stagioni", ingredients: ["Tomato sauce", "Mozzarella", "Parmesan", "Basil", "Mushrooms", "Artichokes", "Cooked ham", "Olives", "Olive oil"], restaurant_id: 2 },
  { name: "Regina", ingredients: ["Tomato sauce", "Mozzarella", "Ham", "Champignons"], restaurant_id: 4 },
  { name: "Romana", ingredients: ["Tomato sauce", "Mozzarella", "Anchovies", "Oregano", "Olive oil"], restaurant_id: 5 },
  { name: "Rusticana", ingredients: ["Tomato sauce", "Buffalo ricotta", "Oyster mushrooms"], restaurant_id: 3 },
  { name: "Salame", ingredients: ["Tomato sauce", "Mozzarella", "Italian salami"], restaurant_id: 2 },
  { name: "Salmone", ingredients: ["Tomato sauce", "Mascarpone cheese", "Smoked salmon", "Rocket salad (arugula)"], restaurant_id: 1 },
  { name: "Salsiccia", ingredients: ["Tomato sauce", "Mozzarella", "Salsiccia", "Radicchio Trevisano"], restaurant_id: 2 },
  { name: "Sardenaira (Pizza all’Andrea)", ingredients: ["Tomato sauce", "Salted anchovies", "Olives", "Garlic cloves", "Capers"], restaurant_id: 4 },
  { name: "Siciliana", ingredients: ["Tomato sauce", "Mozzarella", "Garlic", "Salami", "Hot peppers", "Olive oil"], restaurant_id: 3 },
  { name: "Siciliana Bianca", ingredients: ["Four cheese", "Anchovies", "Capers"], restaurant_id: 2 },
  { name: "Speziale", ingredients: ["Tomato sauce", "Mozzarella", "Ham", "Salami", "Champignons", "Olives", "Artichoke"], restaurant_id: 4 },
  { name: "Spinaci", ingredients: ["Tomato sauce", "Mozzarella", "Spinach", "Salt", "Pepper", "Olive oil"], restaurant_id: 4 },
  { name: "Spinaci e Uovo", ingredients: ["Tomato sauce", "Mozzarella", "Spinach", "Salt", "Pepper", "Olive oil", "Egg"], restaurant_id: 1 },
  { name: "Spinaci e Gorgonzola", ingredients: ["Tomato sauce", "Gorgonzola", "Spinach"], restaurant_id: 2 }
]

pizza_counter = 1

pizza_data.each do |pizza|
  Pizza.create(id: pizza_counter, name: pizza[:name], ingredients: pizza[:ingredients], restaurant_id: pizza[:restaurant_id])
  pizza_counter += 1
end
puts "seeding"
5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address
  )
end
puts "seeding restaurants"
restaurants = Restaurant.all
pizzas = Pizza.all

pizzas.each do |pizza|
  restaurant = restaurants.sample
  RestaurantPizza.create(
    pizza_id: pizza.id,
    restaurant_id: restaurant.id,
    price: Faker::Commerce.price(range: 5..15),
  )
end

puts "Seeding completed!"