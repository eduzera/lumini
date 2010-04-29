ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home", :action => "index"
  
  map.admin "/admin", :controller => "admin/home", :action => "index"
  
  map.resources :home,            :only => [:index, :show]
  map.resources :solutions,       :only => [:index, :show]
  map.resources :lang_designers,  :only => [:index, :show]
  map.resources :lang_prizes,     :only => [:index, :show]
  map.resources :languages,       :only => [:index, :show]
  map.resources :prizes,          :only => [:index, :show]
  map.resources :families,        :only => [:index, :show]
  map.resources :categories,      :only => [:index, :show]
  map.resources :manufactures,    :only => [:index, :show]
  map.resources :images,    :only => [:index, :show]
  
  map.resources :products, :only => [:index, :show] do |product|
    product.resources :designers, :only => [:index, :show]
  end
  
  map.connect 'admin/designers/add_new_language',       :controller => "admin/designers",   :action => 'add_new_language'
  map.connect 'admin/manufactures/add_new_language',    :controller => "admin/manufactures", :action => 'add_new_language'
  map.connect 'admin/categories/add_new_language',      :controller => "admin/categories",   :action => 'add_new_language'
  map.connect 'admin/stores/add_new_language',          :controller => "admin/stores",       :action => 'add_new_language'
  map.connect 'admin/prizes/add_new_language',          :controller => "admin/prizes",       :action => 'add_new_language'
  map.connect 'admin/products/add_new_language',        :controller => "admin/products",     :action => 'add_new_language'
  map.connect 'admin/products/add_new_prize',           :controller => "admin/products",     :action => 'add_new_prize'

  map.admin_images "/admin/images/:imageable_type/:id/:type", :controller => "admin/images", :action => 'show'
  map.admin_image '/admin/images/', :controller => "admin/images", :action => 'create'
  map.delete_admin_image '/admin/images/', :controller => "admin/images", :action => 'destroy'
  map.change_image '/change_image/:imageable_id/galeries/:id', :controller => 'galeries', :action => 'changeimage'
  map.galery "/galery/:imageable_id/:id", :controller => "galeries", :action => 'show'
  map.galeries "/galeries/:imageable_id/:id", :controller => "galeries", :action => 'index'
  map.show_images '/show_image/:product_id/image/:imagetype', :controller => 'admin/images', :action => 'show'   
  
  map.namespace(:admin) do |admin|
    admin.resources :home,      :only => [:index]
  	admin.resources :products
  	admin.resources :images
  	admin.resources :prizes
  	admin.resources :designers
  	admin.resources :stores
  	admin.resources :categories
  	admin.resources :manufactures
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
