require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListsController do
  integrate_views
  it_should_behave_like 'a logged user'

  it 'should not be able to see private lists' do
    @list = Factory :list, :public => false
    get :show, :user_id => @list.user.id, :id => @list.id
    response.response_code.should == 404
  end

  it 'should not be able to create a list as another user' do
    @list = Factory :list
    get :new, :user_id => @list.user.id, :id => @list.id
    response.response_code.should == 404
    post :create, :user_id => @list.user.id, :id => @list.id, :list => {}
    response.response_code.should == 404
  end

  it 'should watch a new list' do
    @list = Factory :list
    post :watch, :id => @list.id
    response.should have_text(/you're watching/i)
    watched_lists.should include(@list)
  end

  it 'should "unwatch" a list' do
    @list = (Factory :watch, :user => @logged_user).list
    post :watch, :id => @list.id
    response.should have_text(/not watching/i)
    watched_lists.should_not include(@list)
  end

  def watched_lists
    @logged_user.reload
    @logged_user.watches.collect(&:list)
  end
end
