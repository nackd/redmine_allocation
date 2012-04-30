module Allocation
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_settings_members_table_header,
              :partial => 'hooks/allocation/view_projects_settings_members_table_header'
    render_on :view_projects_settings_members_table_row,
              :partial => 'hooks/allocation/view_projects_settings_members_table_row'
  end
end
