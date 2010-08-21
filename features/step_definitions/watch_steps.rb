Given /^another person has created (\d+) public lists$/ do |public_lists|
  @another_person ||= Factory :user, :email => 'another@user.com'
  public_lists.to_i.times do
    Factory :list, :user => @another_person
  end
end

Given /^another person has created (\d+) private lists$/ do |private_lists|
  @another_person ||= Factory :user, :email => 'another@user.com'
  private_lists.to_i.times do
    Factory :list, :user => @another_person, :public => false
  end
end

When /^I search for "([^"]*)"$/ do |search_string|
  pending # express the regexp above with the code you wish you had
end

