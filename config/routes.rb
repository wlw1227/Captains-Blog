Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users, only: [:show] do
    resources :profiles, only: %i[new create edit update]
  end
end
