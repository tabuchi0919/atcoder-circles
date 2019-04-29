Rails.application.routes.draw do
  resources :circles, param: :circle_name, only: [:index, :show]
  resources :circle_users, only: [:create, :destroy]
end
