MdApp::Application.routes.draw do


  resources :social_links


  resources :social_brands


  resources :menu_items do
    collection { post :sort}
  end

  resources :menus


  resources :photos

  resources :galleries

  resources :gallery_categories

  resources :media_types

  resources :pdf_files

  resources :members

  resources :events

  resources :locations

  resources :event_statuses

  resources :event_types

  resources :grants

  resources :assignments

  resources :rights

  resources :roles

#	resources :users

devise_for :users, :skip => [:registrations]                                          
    as :user do
      get "login", :to => "devise/sessions#new"
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users' => 'devise/registrations#update', :as => 'user_registration'            
    end

  resources :users

  resources :pages

  match 'membership' => 'pages#show', :id => 2, :as => :membership
  match 'ramp_safety' => 'pages#show', :id => 3, :as => :ramp_safety
  match 'about_us' => 'pages#show', :id => 4, :as => :about_us
  match 'admin' => 'pages#show', :id => 6, :as => :admin
  match 'contact_us' => 'pages#show', :id => 7, :as => :contact_us
  match 'member_application_received' => 'members#member_application_received', :as => :member_application_received
  match 'member_admin' => 'members#member_admin', :as => :member_admin

  
  match 'home' => 'pages#home', :as => :home, :via => :get
  match 'admin' => 'pages#admin', :as => :admin, :via => :get

  root :to => 'pages#home'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
