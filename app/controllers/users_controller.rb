class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	#@user = user.new(user_params)
  	# password stuff here!!
  	if @user.save
  		flash[:success] = "Thanks for signing up!"
  	#log them in here
  	redirect_to root_path
  	else
  		flash[:error] = "Try again"
  		render :new
  	end
  end

  def edit
  	@user = user.new(user_params[:id])
  end

  def update
  	@user = user.new(user_params[:id])
  	if @user.update(user_params)
  		flash[:success] = "successfully updated #{@user.username}."
  		redirect_to root_path
  	else
  		flash[:error] = "Try again"
  		render :edit
  	end
  end

  def destroy
  	users = User.find(params[:id])
  	user.destroy
  	flash[:success] = "User #{user} destroyed."
  	redirect_to root_path
  end


  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

end
