require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DashboardController do
  integrate_views

  it 'should redirect to a login screen, if the user is not logged' do
    get :index
    response.should redirect_to(new_user_session_path)
  end

  it 'should show the current user lists' do
    sign_in Factory(:user)
    get :index
    response.should be_success
    pending
  end
end
