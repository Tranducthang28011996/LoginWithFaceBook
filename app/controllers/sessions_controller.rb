class SessionsController < ApplicationController
  def new
  end
  def login_user
    @users=User.find_by(email: params[:session][:email].downcase)
    if @users && @users.authenticate(params[:session][:password]) 
    session[:user_id]=@users.id
    redirect_to '/'
    else
      render :new
    end 
  end

  def create
      auth = request.env["omniauth.auth"]
      session[:omniauth] = auth.except 'extra'
      user = User.sign_in_from_omniauth auth
      session[:user_id] = user.id
      redirect_to root_url, notice: "SIGNED IN"
    end

    def destroy
     session[:user_id] = nil
     session[:omniauth] = nil
     redirect_to root_url, notice: "SIGNED OUT"
  end
end
