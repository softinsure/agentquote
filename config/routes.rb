ActionController::Routing::Routes.draw do |map|
  map.resources :group_permissions

  map.resources :line_of_businesses

  map.resources :groups

  map.resources :group_activities

  map.resources :policy_headers

  map.resources :policies
  
  map.resources :search_entities
  
  map.resources :payments
  
  map.resources :payment_plans

  map.resources :agencies

  map.resources :agents

  map.resources :documents
    
  map.resources :search
  
  map.resources :list

  map.resources :error_logs

  map.resources :xmlstores

  map.resources :page_updated_infos
  
  map.resources :file_reader

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
  #map.resources :quotes
  #map.resources :policies, :has_one =>[:quotes]
  map.resources :quotes, :has_one =>[:xmlstores,:search_entities,:payments]
  map.resources :quotes, :has_many => [:documents, :page_updated_infos]
  map.resources :users
  map.resource :sessions  #map.resources :error_logs
  
  map.signup '/signup', :controller => 'users',:action => 'new'
  map.login '/login', :controller => 'sessions',:action => 'new'
  map.logout '/logout', :controller => 'sessions',:action => 'destroy'
  #map.logout '/session/destroy/0.xml', :controller => 'sessions',:action => 'destroy'
  #map.connect '/list/', :controller => 'list',:action => 'list'
  
  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
