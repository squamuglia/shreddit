class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_slug(params[:slug])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.slug = to_slug(user_params[:username])
    if @user.save
      redirect_to "/users/#{@user.slug}"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_slug(params[:slug])
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user = User.find_by_slug(params[:slug]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :photo, :bio)
  end

end
