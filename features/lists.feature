Feature: Manage lists and tasks
  In order to organize myself
  As an authenticated user
  I want to create lists and tasks

@culerity
Scenario: Create a new list
  Given that I'm already an user
  And I'm already logged
  And I click on "New list"
  And I fill in "Name" with "A new list"
  And I click on "New task"
  And I fill in "Task name" with "Task one"
  When I click on "Save"
  Then I should see "A new list"
  And I should see "Task one"

Scenario: See my lists
  Given that I'm already an user
  And I'm already logged
  And I have 3 lists already
  When I click on "show all lists"
  Then I should see "List 1"
  And I should see "List 2"
  And I should see "List 3"
