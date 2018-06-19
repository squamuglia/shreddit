Rails.application.routes.draw do
  get '/' => 'forums#index'

  resources :posts, only: [:create, :update, :destroy]
  resources :users, except: [:new, :index, :show]
  resources :forums, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :comments, only: :create
  resources :sessions, only: [:create]
  delete "/sessions", to: "sessions#destroy", as: "destroy_session"
  get '/login' => 'sessions#new'
  get '/register' => 'users#new'



  get 'forums/:slug' => 'forums#show'
  get 'forums/:slug/posts/new' => 'posts#new'
  get 'forums/:slug/posts/:slug' => 'posts#show'
  get 'forums/:slug/posts/:slug/edit' => 'posts#edit'
  get 'users/:slug' => 'users#show'

end
