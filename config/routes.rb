ActionController::Routing::Routes.draw do |map|
  map.resources :google_forms

  map.root :controller => 'home', :action => 'index'
  
  map.catch_all "*slug", :controller => "operate_form", :action => "show"
  
end
