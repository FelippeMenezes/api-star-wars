Rails.application.routes.draw do
  get 'starships/index'
  devise_for :users
  root to: 'characters#index'
  get "characters", to: "characters#index"
  get "characters/:id", to: "characters#show", as: :character
  get "planets", to: "planets#index"
  get "starships", to: "starships#index"
end
