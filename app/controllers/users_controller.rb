class UsersController < ApplicationController
before_filter :authenticate, only: [:show, :edit, :update]
before_filter :correct_user, only: [:show, :edit, :update]

	def index
		redirect_to user_path(current_user)
	end
	
	def new
		@user = User.new
		@title = "Sign Up"		
	end

	def show
		@user = User.find(params[:id])
		@title = @user.first_name	
	end

	def create
		@user = User.create(params[:user])
		if @user.save
			sign_in(@user)
			render "pages/home", flash: {success: "Welcome to Agro Details..!!"}
		else
			@title = "Sign up"
			render 'new'
		end		
	end

	def edit
		@title = "Edit Profile"		
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		# if @user.update_attributes(first_name: params[:first_name],
		# 									last_name: params[:last_name],
		# 									age: params[:age],
		# 									phone_no: params[:phone_no],
		# 									address: params[:address],
		# 									city: params[:city],
		# 									state: params[:state],
		# 									country: params[:country])
		if @user.update_attributes(params[:user])
			render 'show', flash: {success: "Profile updated!"}
		else
		render 'edit'
		end

	end

private

	def correct_user
   	@user = User.find(params[:id])
   	redirect_to root_path unless current_user?(@user)   		
   end

end
