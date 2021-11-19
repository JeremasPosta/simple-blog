Rails.application.routes.draw do
  resources :categories
  resources :posts
  post '/auth/sign_up', to: 'users#create'
  post '/auth/login', to: 'authentication#authenticate'
end
