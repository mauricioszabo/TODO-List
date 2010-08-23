require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListsHelper do
  include ListsHelper

  it 'should generate a valid name for a object' do
    name_to(:id).should == 'list[tasks_attributes][][id]'
  end

  it 'should create a link to create new tasks' do
    add_task_link(stub_form_builder).should have_tag('a')
  end

  it 'should create a new link to remove the task' do
    remove_task_link.should have_tag('a')
  end

  def stub_form_builder
    form_builder = mock("FormBuilder")
    form_builder.stub!(:fields_for)
    form_builder
  end
end
