Rails.application.routes.draw do
  get '/' => 'forums#index'

  resources :posts, only: [:create, :update, :destroy]
  resources :users, only: [:create, :destroy]
  resources :forums, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :comments, only: [:create]
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
  get 'users/:slug/edit' => 'users#edit', as: "edit_user"
  patch 'users/:id' => 'users#update', as: "update_user"

end
