class SessionsController < ApplicationController
  
  def index
    redirect_back_or_user_path(root_path)
  end
  
  def new
  	@title = "Sign In"
  end

  def create
  	user = User.authenticate(params[:sessions][:email],params[:sessions][:password])
  	
  	if user.nil?
  		flash.now[:error] = "Incorrect Login details"
  		render 'new'
  	else
  		sign_in(user)
      #will redirect to previous path upon sign in
  		redirect_back_or_user_path(root_path)
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path, flash: {success: "Logged out successfully!"}
  end
end
