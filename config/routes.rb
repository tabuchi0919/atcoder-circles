Rails.application.routes.draw do
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :circles, param: :circle_name, only: [:index, :show]
  resources :circle_users, only: [:create, :destroy]
  resources :contests, only: [:show]
end
