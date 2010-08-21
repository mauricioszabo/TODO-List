Given /^that I'm already an user$/ do
  Factory :user
end

Given /^I'm already logged$/ do
  visit path_to('the home page') 
  fill_in "Email", :with => "test@user.com"
  fill_in "Password", :with => "test_test"
  click "Sign in"
end

