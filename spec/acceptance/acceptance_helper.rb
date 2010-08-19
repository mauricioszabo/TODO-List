require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'

Spec::Runner.configure do |config|
  config.include Capybara 
  config.before(:each) do
    Capybara.current_driver = :selenium if options[:js]
  end

  config.after(:each) do
    Capybara.use_default_driver if options[:js]
  end
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
