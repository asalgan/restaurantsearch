RestaurantSearch::Application.routes.draw do
  
  root 'criteria#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  post '/add_item_to_user' => 'favorites#add_item_to_user'


  #Routes for logging in/out
  match 'auth/:provider/callback', to: 'sessions#omniauth_create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signup', to: 'users#new', via: 'get'

  #------------------------------

  # Routes for the Menu resource:
  # CREATE
  

  get '/menus/new', controller: 'menus', action: 'new', :as => 'new_menu'
  post '/menus', controller: 'menus', action: 'create'

  # READ
  get '/menus', controller: 'menus', action: 'index'
  get '/menus/:id', controller: 'menus', action: 'show', :as => 'menu'

  # UPDATE
  get '/menus/:id/edit', controller: 'menus', action: 'edit', :as => 'edit_menu'
  patch '/menus/:id', controller: 'menus', action: 'update'

  # DELETE
  delete '/menus/:id', controller: 'menus', action: 'destroy'
  #------------------------------

end
