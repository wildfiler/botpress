Rails.application.routes.draw do
  resources :games, only: [:show]
  resources :bots, only: [:show] do
    resources :games, only: [:show], module: 'bots'
  end

  scope module: 'clearance' do
    resources :passwords, only: [:create, :new]
    resource :session, only: [:create]

    resources :users, only: [:create] do
      resource :password, only: [:create, :edit, :update]
    end

    get '/sign_in' => 'sessions#new', as: 'sign_in'
    delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
    get '/sign_up' => 'users#new', as: 'sign_up'
  end

  resource :profile, only: [:show] do
    resource :password, only: [:update], module: :profile
  end

  root 'home#index'
end
