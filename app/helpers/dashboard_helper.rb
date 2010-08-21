module DashboardHelper
  def remaining_lists
    remaining = @list_count - DashboardController::MAX_LISTS
    remaining > 0 ? remaining : 0
  end
end
