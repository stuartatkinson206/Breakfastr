class SessionsController < ApplicationController
  def new
  end

  def create
  	# find user
  	username = params[:session][:username]
  	password = params[:session][:password]
  	@user = User.find_by(username: username)
  	# look inside the username column in the User model db table for the user name
  
	# authenticate user and password
  	if @user.present? and @user.authenticate(password)
  		flash[:success] = "Logging in.."
  		# log them in
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "epic fail, try again"
  		render :new
  	end
  end

  def show
  end

  def destroy
    reset_session
    flash[:success] = "See you soon"
    redirect_to root_path
  end

end
