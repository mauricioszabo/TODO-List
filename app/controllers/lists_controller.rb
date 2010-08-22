class ListsController < InheritedResources::Base
  respond_to :html, :xml
  belongs_to :user
  actions :create, :new, :index, :show
  #before_filter :check_current_user, :unless => [:index, :show]
  before_filter :check_invalid_user, :only => [:new, :create]

  def collection
    @user = User.find(params[:user_id])
    @lists = @user.lists.all(:include => :tasks)
  end
  private :collection
  
  def show
    show! do
      private_list = !@list.public? && @list.user != current_user
      return render_404 if private_list
    end
  end

  def check_invalid_user
    render_404 unless current_user.id == params[:user_id].to_i
  end
  private :check_invalid_user

  def render_404
    render :file => 'public/404.html', :status => :not_found
  end
  private :render_404

  def watch
    @list = List.find params[:id]
    watch = current_user.watches.find_by_list_id(params[:id])
    if watch
      watch.destroy
      render :partial => 'unwatching'
    else
      current_user.watches.create! :list_id => params[:id]
      render :partial => 'watching'
    end
  end
end
