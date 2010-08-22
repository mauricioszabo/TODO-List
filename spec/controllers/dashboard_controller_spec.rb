require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DashboardController do
  integrate_views

  it 'should redirect to a login screen, if the user is not logged' do
    get :index
    response.should redirect_to(new_user_session_path)
  end

  it 'should show the current user lists' do
    sign_in( @user = Factory(:user) )
    Factory :list, :user => @user, :name => "A list"
    get :index
    response.should be_success
    response.should have_text(/A list/)
  end

  it 'should search for public lists' do
    sign_in Factory(:user)
    list = Factory.stub :list, :name => "A list"
    List.should_receive(:find_public_lists).with('A list').and_return([list])
    post :search, :search => 'A list'
    response.should have_text(/A list/)
  end

  it 'should return a message if search does not find public lists' do
    sign_in Factory(:user)
    List.should_receive(:find_public_lists).and_return([])
    post :search, :search => 'A list'
    response.should have_text(/no lists/i)
  end
end
