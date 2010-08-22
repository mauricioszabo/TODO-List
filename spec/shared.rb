describe 'a logged user', :shared => true do
  before do
    @logged_user = Factory(:user)
    sign_in @logged_user
  end
end
