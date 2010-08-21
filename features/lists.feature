Feature: Manage lists and tasks
  In order to organize myself
  As a authenticated user
  I want to create lists and tasks

@culerity @wip
Scenario: Create a new list
  Given that I'm already an user
  And I'm already logged
  And I click on "New list"
  And I fill in "Name" with "A new list"
  And I click on "New task"
  And I fill in "Task name" with "One"
  When I click "Save"
  Then I should see "created"
  And I should see "A new list"
