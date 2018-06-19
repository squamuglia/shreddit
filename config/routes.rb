Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:create, :update, :destroy]
  resources :users
  resources :forums, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :comments, only: :create

  get 'forums/:slug' => 'forums#show'
  get 'forums/:slug/posts/:slug' => 'posts#show'
  get 'forums/:slug/posts/:slug/edit' => 'posts#edit'
  get 'forums/:slug/posts/new' => 'posts#new'


end
