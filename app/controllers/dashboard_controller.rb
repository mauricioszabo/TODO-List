class DashboardController < ApplicationController
  MAX_LISTS = 2

  def index
    return redirect_to new_user_session_path unless user_signed_in?
    @list_count = current_user.lists.count
    @lists = current_user.lists.all :limit => MAX_LISTS
    @watches = current_user.watches.all
  end

  private
  def secure?
    false
  end
end
