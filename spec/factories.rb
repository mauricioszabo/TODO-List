Factory.define :user do |f|
  f.name 'Test User'
  f.sequence(:email) { |i| "test_#{i}@user.com" }
  f.password 'test_test'
end

Factory.define :list do |f|
  f.sequence(:name) { |i| "List #{i}" }
  f.public true
  f.association :user
end

Factory.define :task do |f|
  f.sequence(:name) { |i| "Task #{i}" }
  f.association :list
end

Factory.define :watch do |f|
  f.association :user
  f.association :list
end
