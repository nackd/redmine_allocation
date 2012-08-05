if Rails::VERSION::MAJOR > 1
  get 'projects/:id/project_allocation', :to => 'allocation#by_project', :as => 'allocation_by_project'
  get 'project/:id/user_allocation', :to => 'allocation#by_user', :as => 'allocation_by_user'
else
  ActionController::Routing::Routes.draw do |map|
    map.allocation_by_project 'projects/:id/project_allocation', :controller => 'allocation', :action => 'by_project'
    map.allocation_by_user 'projects/:id/user_allocation', :controller => 'allocation', :action => 'by_user'
  end
end
