ActionController::Routing::Routes.draw do |map|
  map.allocation_by_project 'projects/:id/project_allocation', :controller => 'allocation', :action => 'by_project'
  map.allocation_by_user 'projects/:id/user_allocation', :controller => 'allocation', :action => 'by_user'
end
