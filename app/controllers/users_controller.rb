class UsersController < ApplicationController

  def new
  	@users =User.new
    @kt = false
  end
  def create
  	@user = User.create(users_params)
  	if @user.save
  		redirect_to '/'
  	else 
  		render :new
  	end
  end

  private 
  	def users_params
  		params.require(:user).permit(:name, :email ,:password , :password_confirmation)
  	end
end
