Rails.application.routes.draw do
  devise_for :users
  root to: 'characters#index'
  get "characters", to: "characters#index"
  get "characters/:id", to: "characters#show", as: :character
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
