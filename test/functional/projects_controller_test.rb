require File.dirname(__FILE__) + "/../test_helper"

class ProjectsControllerTest < AllocationControllerTestCase
  test "project members page does not show allocation fields if the module is not enabled" do
    admin_login
    get :settings, :id => "ecookbook"
    assert_response :success

    assert_select "#tab-content-members table.members thead th", :count => 0, :html => I18n.t(:field_allocation)
    assert_select "#tab-content-members table.members thead th", :count => 0, :html => I18n.t(:field_from_date)
    assert_select "#tab-content-members table.members thead th", :count => 0, :html => I18n.t(:field_to_date)
  end

  test "project members page shows allocation fields if the module is enabled" do
    admin_login
    get :settings, :id => "allocation"
    assert_response :success

    assert_select "#tab-content-members table.members thead th", :count => 1, :html => I18n.t(:field_allocation)
    assert_select "#tab-content-members table.members thead th", :count => 1, :html => I18n.t(:field_from_date)
    assert_select "#tab-content-members table.members thead th", :count => 1, :html => I18n.t(:field_to_date)
  end

  test "overview sidebar shows a link to allocation info" do
    admin_login
    get :show, :id => "allocation"
    assert_response :success

    assert_select "div#sidebar a", :count => 1, :text => I18n.t(:"allocation.label_by_project")
    assert_select "div#sidebar a", :count => 1, :text => I18n.t(:"allocation.label_by_user")
  end
end
