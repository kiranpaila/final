class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :destroy

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])

      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      session[:admin] = user.id
      session[:isadmin] = user.isadmin

      redirect_to users_path
    else
      flash[:notice] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    reset_session
    #session[:userdetails]=nil

    redirect_to login_path
  end
end
