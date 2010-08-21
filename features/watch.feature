Feature: Find other lists to watch
  In order to look into other's life
  As an authenticated user
  I want to watch his/her lists

@wip
Scenario: Find public lists to watch
  Given that I'm already an user
  And I'm already logged
  And that I am on dashboard
  And another person has created 4 public lists
  And another person has created 2 private lists
  When I fill in "List name" with "List 1"
  And click on "Search"
  Then I should see "List 1"

