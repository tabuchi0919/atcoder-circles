Rails.application.routes.draw do
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :circles, param: :circle_name, only: %i[index show new create update destroy]
  resources :circle_users, only: %i[create destroy]
  resources :contests, only: %i[show]
  resources :virtual_contests, only: %i[create destroy]
end
