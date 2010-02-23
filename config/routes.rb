ActionController::Routing::Routes.draw do |map|
  map.resources :google_forms

  map.root :controller => 'home', :action => 'index'
end
