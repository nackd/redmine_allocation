ActionController::Routing::Routes.draw do |map|
  map.allocation_by_project 'projects/:id/allocation', :controller => 'allocation', :action => 'by_project'
end
