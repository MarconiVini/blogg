Rails.application.routes.draw do
  devise_for :authors
  namespace :authors do
    resources :posts do
      resources :elements
    end
  end
  root to: 'home#index'
end
