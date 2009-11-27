ActionController::Routing::Routes.draw do |map|
  map.resources :products
  map.resources :prices, :collection => { :batch_edit => :get, :batch_update => :post }
  
  map.root :controller => "products", :action => "index"
end
