module Allocation
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_settings_members_table_header,
              :partial => 'hooks/allocation/view_projects_settings_members_table_header'
    render_on :view_projects_settings_members_table_row,
              :partial => 'hooks/allocation/view_projects_settings_members_table_row'
    render_on :view_projects_show_sidebar_bottom,
              :partial => 'hooks/allocation/view_projects_show_sidebar_bottom'
  end
end
