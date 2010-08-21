require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DashboardHelper do
  include DashboardHelper

  it "should return the remaining lists or zero if it's below zero" do
    @list_count = 0
    remaining_lists.should == 0
    @list_count = 3
    remaining_lists.should == 1
  end
end
