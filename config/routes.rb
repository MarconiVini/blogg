Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :authors

  namespace :authors do
    resources :posts do
      resources :elements
    end
  end

  root to: 'home#index'
end
