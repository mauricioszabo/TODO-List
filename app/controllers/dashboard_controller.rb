class DashboardController < ApplicationController
  MAX_LISTS = 2

  def index
    return redirect_to new_user_session_path unless user_signed_in?
    @list_count = current_user.lists.count
    @lists = current_user.lists.all :limit => MAX_LISTS
    @watches = current_user.watches.all :include => { :list => :user }
  end

  def search
    @lists = List.find_public_lists(params[:search])
    if @lists.empty?
      render :text => "There are no lists that satisfy your criteria"
    else
      render :partial => 'search'
    end
  end

  private
  def secure?
    false
  end
end
