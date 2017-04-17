Rails.application.routes.draw do
  root 'sessions#new'
  get 'charts/index'

 get 'categories' =>'category#index'
    get 'categories' =>'category#index'
    get 'categories/new' =>"category#new"
    post 'categories' =>"category#create"
    delete 'categories/:id/' =>'category#destroy' ,as: :delete_categories
    resources :category
    resources :users, only: [:new, :create]
    resources :incomes
    delete 'incomes/:id/' =>'incomes#destroy' ,as: :delete_incomes
    # resources :reports


    resources :costs
    delete 'costs/:id/' =>'costs#destroy' ,as: :delete_costs

	get 'home/profile'

	get 'login' => 'sessions#new'
  	post 'login' => 'sessions#login_user'
 
	get '/auth/:provider/callback' => 'sessions#create'
	get 'auth/failure', to: redirect('/')
	delete 'signout', to: 'sessions#destroy', as: 'signout'


    get 'chart', to: 'application#charts'

end

