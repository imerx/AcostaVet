RailStrap::Application.routes.draw do

  resources :posts


  get "publico/about"
  get "publico/services"
  get "publico/contact_us"
  get "publico/gallery"
  

  namespace :admin do
     
     resources :clients do
     resources :animals  
      
  end
        resources :categories do
          resources :animals 
        end
        resources :publico do
          resources :posts 
        end
        resources :animal_vacunas
      resources :consults
     resources :animal_servicios
          
         resources :animalhistories
         resources :doctors
         resources :vacunas        
         resources :events
  end #end
   

  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  
  root :to => "publico#index"

  get "cart" => "cart#show"
  get "cart/add/:id" => "cart#add", :as => :add_to_cart
  post "cart/remove/:id" => "cart#remove", :as => :remove_from_cart
  post "cart/checkout" => "cart#checkout", :as => :checkout
  #match 'signup' => 'users#new', :as => :signup
  #match 'logout' => 'sessions#destroy', :as => :logout
  #match 'login' => 'sessions#new', :as => :login
  
  resources :products
  resources :calendars
  resources :events
  resources :event_instances

  match "/test" => "calendars#test", :as => :test
 
  #root :to => 'calendars#index'
  
  
end
