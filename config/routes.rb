Rails.application.routes.draw do
root 'home#index'
  get 'home/profile'
 
  get '/auth/:provider/callback' => 'sessions#create'
get 'auth/failure', to: redirect('/')
get 'signout', to: 'sessions#destroy', as: 'signout'
end

