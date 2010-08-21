class ListsController < InheritedResources::Base
  respond_to :html, :xml
  belongs_to :user
  actions :create, :new, :index, :show

  def collection
    @user = User.find(params[:user_id])
    @lists = @user.lists.all(:include => :tasks)
  end
end
