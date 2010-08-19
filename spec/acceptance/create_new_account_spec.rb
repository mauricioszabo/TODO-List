require File.dirname(__FILE__) + '/acceptance_helper'

feature "Create new accounts", %q{
  In order to be able to create lists
  As a new user
  I want to be able to sign up
} do
  
  scenario "Sign-up for a new account" do
    visit homepage
    click 'Sign Up'
    fill_in 'Name', :with => 'Foo Bar Baz'
    fill_in 'Password', :with => 'a_test'
    click 'Save'
    response.body.should match('Sign In')
  end
  
end
