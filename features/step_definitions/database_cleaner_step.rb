After do
  click 'Sign out' if body.include?('Sign out')
  DatabaseCleaner.clean!
end
