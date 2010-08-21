require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListsHelper do
  include ListsHelper

  it 'should generate a valid name for a object' do
    name_to(:id).should == 'list[tasks_attributes][][id]'
  end
end
