Rails.application.routes.draw do
  resources :games, only: [:show]

  resources :bots, only: [:show] do
    resources :games, only: [:show], module: 'bots'
  end

  resources :accounts, only: [:show] do
    resources :games, only: [:show], module: 'accounts'
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
    scope module: 'profile' do
      resource :password, only: [:update]
      resource :account, only: [:show]
      resources :bots, only: [:new, :create]
    end
  end

  get '/:id', to: 'games#show', as: :root_game
  root 'home#index'
end
