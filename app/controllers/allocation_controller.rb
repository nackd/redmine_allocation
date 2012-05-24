class AllocationController < ApplicationController
  before_filter :find_project
  menu_item :overview

  def by_project
    @projects = Project.find :all,
                             :conditions => @project.project_condition(true),
                             :include => [:members => :user],
                             :order => "#{Project.table_name}.lft"
  end
end
