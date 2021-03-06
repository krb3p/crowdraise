module ApplicationHelper
  def current_user
    @_current_user ||= User.find_by_id( session[:user_id] )
  end
    # helper_method :current_user

  def is_logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if !is_logged_in?
      flash[:alert] = "Please login to view that page!"
      redirect_to '/'
    end
  end
  # Simply checks if the @user instance variable
  # is the current user. Used to check if we're
  # looking our own profile page, basically.
  # See app/views/users/show.html.haml
  def is_myself?
    @user == current_user
  end
end
