Given /^I have (\d+) lists already$/ do |number|
  number.to_i.times { Factory :list, :user => @user }
end

