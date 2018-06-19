class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user = User.find_by(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :photo, :bio)
  end

end
