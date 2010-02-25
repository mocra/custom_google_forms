ActionController::Routing::Routes.draw do |map|
  map.resources :google_forms

  map.with_options :controller => 'operate_form' do |f|
    f.root :action => 'index'
    f.submit_operate_form "operate_form/:id", :action => "update"
    f.catch_all "*slug", :controller => "operate_form", :action => "show"
  end
  
  
end
