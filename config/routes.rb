Rails.application.routes.draw do
  get '/' => 'forums#index'

  resources :posts, only: [:create, :update, :destroy]
  resources :users, except: [:new, :index, :show]
  resources :forums, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :comments, only: :create
  resources :sessions, only: [:create]
  delete "/sessions", to: "sessions#destroy", as: "destroy_session"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/register' => 'users#new'



  get 'forums/:slug' => 'forums#show', as: "show_forum"
  get 'forums/:slug/posts/new' => 'posts#new', as: "new_post"
  get 'forums/:slug/posts/:slug' => 'posts#show', as: "show_post"
  get 'forums/:slug/posts/:slug/edit' => 'posts#edit', as: "edit_post"
  get 'users/:slug' => 'users#show', as: "show_user"
end
