RestaurantSearch::Application.routes.draw do
  
  root 'criteria#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # Routes for the Location resource:
  # CREATE
  get '/locations/new', controller: 'locations', action: 'new', :as => 'new_location'
  post '/locations', controller: 'locations', action: 'create'

  # READ
  get '/locations', controller: 'locations', action: 'index'
  get '/locations/:id', controller: 'locations', action: 'show', :as => 'location'

  # UPDATE
  get '/locations/:id/edit', controller: 'locations', action: 'edit', :as => 'edit_location'
  patch '/locations/:id', controller: 'locations', action: 'update'

  # DELETE
  delete '/locations/:id', controller: 'locations', action: 'destroy'
  #------------------------------

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

  # Routes for the Restaurant resource:
  # CREATE
  get '/restaurants/new', controller: 'restaurants', action: 'new', :as => 'new_restaurant'
  post '/restaurants', controller: 'restaurants', action: 'create'

  # READ
  get '/restaurants', controller: 'restaurants', action: 'index'
  get '/restaurants/:id', controller: 'restaurants', action: 'show', :as => 'restaurant'

  # UPDATE
  get '/restaurants/:id/edit', controller: 'restaurants', action: 'edit', :as => 'edit_restaurant'
  patch '/restaurants/:id', controller: 'restaurants', action: 'update'

  # DELETE
  delete '/restaurants/:id', controller: 'restaurants', action: 'destroy'
  #------------------------------

end
