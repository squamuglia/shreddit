class UsersController < ApplicationController
  before_action :require_login, except: [:show, :new]


  def index
    @users = User.all
  end

  def show
    @user = User.find_by_slug(params[:slug])
    @posts = @user.posts
    @likes = @user.likes
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.slug = to_slug(user_params[:username])
    if @user.save
      helpers.log_in_user!(@user.id)
      redirect_to "/users/#{@user.slug}"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_slug(params[:slug])
  end

  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to "/users/#{@user.slug}"
  end

  def destroy
    @user = User.find_by_slug(params[:slug]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar, :bio)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
