ActionController::Routing::Routes.draw do |map|
  map.resources :products
  
  map.resources :prices, :collection => { :batch_edit => :get, :batch_update => :post }
end
