helpers do
  def current_user
    find_one_user(session[:user_id])
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
end