Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/api/user' => 'user#create_user', controller: 'user'
  get '/api/user' => 'user#find_all', controller: 'user'
  get '/api/user/:id' => 'user#find_by_id', controller: 'user'
  get '/api/user/name/:username' => 'user#find_by_name', controller: 'user'
  patch '/api/user/avatar' => 'user#upload_avatar', controller: 'user'

  post '/api/auth/login' => 'auth#login', controller: 'auth'
  post '/api/auth/verify' => 'auth#verify', controller: 'auth'

  post '/api/post' => 'post#create_post', controller: 'post'
  get '/api/post' => 'post#find_all', controller: 'post'
  get '/api/post/:id' => 'post#find_by_id', controller: 'post'
  get '/api/post/@me/:author' => 'post#find_my_post', controller: 'post'
end