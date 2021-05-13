Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/help',     to: 'static_pages#help'
  get  'sign_up',   to: 'users#new'
  get  '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  #deleteメソッドが使えない為getに変更
  delete '/logout',  to: 'sessions#destroy'

  resources :microposts,          only: [:create, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :users  do
    collection do
      get 'set'
      get 'search'
    end
    member do
      get 'following'
      get 'followers'
    end
  end

  resources :notices do
    collection do
      get 'search'
    end
  end
  
  resources :messages,           only: [:create]
  resources :rooms,              only: [:create, :show, :index]
  resources :relationships,       only: [:create, :destroy]
end
