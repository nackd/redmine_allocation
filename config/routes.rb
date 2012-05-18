ActionController::Routing::Routes.draw do |map|
  map.allocation 'projects/:id/allocation', :controller => 'allocation', :action => 'show'
end
