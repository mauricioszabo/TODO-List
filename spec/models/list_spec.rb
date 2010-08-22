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

  it 'should return a caption for the list, showing user\'s name' do
    @list = Factory.stub :list
    @list.caption.should include(@list.user.name)
    @list.caption.should include(@list.name)
  end

  it 'should find only public lists, by name' do
    list1 = Factory :list, :name => "A list", :public => true
    list2 = Factory :list, :name => "A list", :public => false
    list3 = Factory :list, :name => "Another one", :public => true
    result = List.find_public_lists("list")
    result.should == [list1]
  end
end
