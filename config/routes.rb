Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/api/user' => 'user#getAll', controller: 'user'
  get '/api/user/:id' => 'user#findById', controller: 'user'
  post '/api/user/avatar' => 'user#uploadAvatar', controller: 'user'

  post '/api/auth/signup' => 'auth#sign_up', controller: 'auth'
  post '/api/auth/login' => 'auth#login', controller: 'auth'
end