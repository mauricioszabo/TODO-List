Given /^another person has created (\d+) public lists$/ do |public_lists|
  @another_person ||= Factory :user, :email => 'another@user.com'
  public_lists.to_i.times do |i|
    Factory :list, :user => @another_person, :name => "Public List #{i}"
  end
end

Given /^another person has created (\d+) private lists$/ do |private_lists|
  @another_person ||= Factory :user, :email => 'another@user.com'
  private_lists.to_i.times do |i|
    Factory :list, :user => @another_person, :name => "Private List #{i}"
  end
end

When /^I search for "([^"]*)"$/ do |search_string|
  visit path_to('dashboard')
  fill_in "search", :with => "List 1"
  click "Search"
end

