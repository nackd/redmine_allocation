module Allocation
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_settings_members_table_header,
              :partial => 'hooks/allocation/view_projects_settings_members_table_header'
  end
end
