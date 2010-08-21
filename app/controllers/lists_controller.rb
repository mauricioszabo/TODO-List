class ListsController < InheritedResources::Base
  respond_to :html, :xml
  actions :create, :new, :index
end
