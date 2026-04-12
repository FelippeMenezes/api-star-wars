Rails.application.routes.draw do
  devise_for :users
  root to: 'characters#index'
  get "characters", to: "characters#index"
  get "characters/:id", to: "characters#show", as: :character
  get "planets", to: "planets#index"
end
