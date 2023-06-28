Rails.application.routes.draw do
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  delete '/restaurants/:id', to: 'restaurants#destroy'
  get '/pizzas', to: 'pizzas#index'
  post '/restaurant_pizzas', to: 'restaurant_pizzas#create'
end
