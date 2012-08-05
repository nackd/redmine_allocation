require File.expand_path "../test_helper", File.dirname(__FILE__)

class IssuesControllerTest < AllocationControllerTestCase
  test "only overview sidebar shows a link to allocation info" do
    admin_login
    get :index, :project_id => "allocation"
    assert_response :success

    assert_select "div#sidebar a", :count => 0, :text => I18n.t(:"allocation.label_allocation")
  end
end
