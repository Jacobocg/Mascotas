Rails.application.routes.draw do
  get 'welcome/index'

  resources :users do
    resources :pets
  end

  post '/users/:user_id/pets/new' => 'pets#create'
  post '/users/:user_id/pets/:id/edit' => 'pets#update'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
