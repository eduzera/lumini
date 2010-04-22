ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home", :action => "index"
  
  map.admin "/admin", :controller => "admin/home", :action => "index"
  
  map.resources :home,            :only => [:index, :show]
  map.resources :galeries,        :only => [:index, :show]
  map.resources :solutions,       :only => [:index, :show]
  map.resources :lang_designers,  :only => [:index, :show]
  map.resources :lang_prizes,     :only => [:index, :show]
  map.resources :languages,       :only => [:index, :show]
  map.resources :prizes,          :only => [:index, :show]
  map.resources :families,        :only => [:index, :show]
  map.resources :categories,      :only => [:index, :show]
  map.resources :designers,       :only => [:index, :show]
  map.resources :manufactures,    :only => [:index, :show]
  
  map.resources :products, :only => [:index, :show] do |product|
    product.resources :images,    :only => [:index, :show]
  end
  
  map.connect 'admin/products/add_new_language', :controller => "admin/products", :action => 'add_new_language'
  map.connect 'admin/products/add_new_prize',    :controller => "admin/products", :action => 'add_new_prize'
  
  map.namespace(:admin) do |admin|
    admin.resources :home,      :only => [:index]
  	admin.resources :products,  :has_many => :images
  end
  

    





  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

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
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end