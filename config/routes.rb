Rails.application.routes.draw do
  resources :admin, :users
  resources :tickets do
  	resources :comments
  end
  devise_for :users

  root 'tickets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get ':controller(/:action(/:id))(.:format)'
  # get "admin/index"      => "admin#index"
  # get "admin/show(/:id)" => "admin#show"
  # get "admin/show/(:id)/edit" => "admin#edit"
  # get "user/new" => "user#new"

end
