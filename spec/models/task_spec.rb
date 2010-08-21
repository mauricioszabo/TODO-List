require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Task do
  it 'should be invalid without a name' do
    @task = Task.new
    @task.should have(1).error_on(:name)
  end
end
