Feature: Manage login, logout, and signup
  In order to organize myself
  As a authenticated user
  I want to create lists and tasks

Scenario: Create a new list
  Given that I am on the home page
  And click on "Sign up"
  And fill in "Name" with "Foo Bar Baz"
  And fill in "Email" with "Foo@Bar.com"
  And fill in "Password" with "a_test"
  And fill in "Password confirmation" with "a_test"
  When I click on "Sign up"
  Then I should see "Dashboard"
  And should see "Foo Bar Baz"

Scenario: Sign in
  Given that I'm already an user with email "test@user.com"
  And that I am on the home page
  And fill in "Email" with "test@user.com"
  And fill in "Password" with "test_test"
  When I click on "Sign in"
  Then I should see "Dashboard"

Scenario: Sign out
  Given that I'm already an user
  And I'm already logged
  When I click on "Sign out"
  Then I should see "Sign in"
