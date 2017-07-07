Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/sign_up"
  get "users/sign_in" => 'sessions#new'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'posts#index'

  resources :posts do
  	resources :comments
  end

  post '/' => 'posts#create'
  patch '/posts/:post_id/comments/:id/edit' => 'comments#update'

  patch '/posts/:post_id/edit' => 'posts#update'

end
