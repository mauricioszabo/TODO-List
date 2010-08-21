module HomeHelper
  def remaining_lists
    remaining = @list_count - HomeController::MAX_LISTS
    remaining > 0 ? remaining : 0
  end
end
