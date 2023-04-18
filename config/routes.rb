Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs, only: :show do
    resources :ingredients, only: :index, controller: 'chefs/ingredients'
  end
  resources :dishes, only: :show
  resources :dish_ingredients, only: :create
end
