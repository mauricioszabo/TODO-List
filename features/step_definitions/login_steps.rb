Given /^that I'm already an user$/ do
  @user = Factory :user
end

Given /^that I'm already an user with email "([^"]*)"$/ do |email|
  @user = Factory :user, :email => email
end

Given /^I'm already logged$/ do
  visit path_to('the home page') 
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => "test_test"
  click "Sign in"
end

