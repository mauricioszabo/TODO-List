require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe List do
  it 'should be invalid without a name' do
    @task = List.new
    @task.should have(1).error_on(:name)
  end
  
  it 'should return a human-friendly text for visibility' do
    @list = Factory.stub :list
    @list.visibility.should == 'Public'
    @list.public = false
    @list.visibility.should == 'Private'
  end
end
