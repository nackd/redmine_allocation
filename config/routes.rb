ActionController::Routing::Routes.draw do |map|
  map.allocation 'projects/:id/allocation', :controller => 'allocation', :action => 'by_project'
end
