class UsersController < ApplicationController
  layout "back_layout"
  before_action :authorize


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user= User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #log_in @user
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to users_path
    else
      render 'new'
    end

  end

  def update
    @user = User.find(params[:id])

    if @user.update(article_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
