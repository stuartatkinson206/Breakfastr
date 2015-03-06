class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# makes below available to the view
  helper_method :logged_in?, :current_user

  def logged_in?
  	session[:user_id].present?
  end

  def current_user
  	User.find(session[:user_id])
  end

  def require_user
  	unless logged_in?
  		flash[:error] = "You must be logged in to do that"
  		redirect_to new_session_path
  	end
  end

  def require_owner
   unless current_user.owns(@pastry)
      flash[:error] = "You must be the authorised baker to do this!"
      redirect_to root_path
    end
  end
end
