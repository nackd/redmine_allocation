require File.dirname(__FILE__) + "/../test_helper"

class MembersControllerTest < AllocationControllerTestCase
  test "does not fail when adding project members" do
    Member.destroy_all
    admin_login
    user_id = User.find_by_login("admin").id
    role_id = Role.find_by_name("Manager").id
    if Redmine::VERSION::MAJOR >= 1 and Redmine::VERSION::MINOR >= 4
      post :create, :project_id => "allocation",
           :membership => { :user_ids => [user_id], :role_ids => [role_id]}
    else
      post :new, :id => "allocation",
           :member => { :user_ids => [user_id], :role_ids => [role_id]}
    end
    assert_response :redirect

    membership = Member.first
    assert_equal 1, Member.count
    assert_equal 100, membership.allocation
    assert_nil membership.from_date
    assert_nil membership.to_date
  end
end
