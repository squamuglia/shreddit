class SessionsController < ApplicationController
  def new
    @errors = []
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      helpers.log_in_user!(@user.id)
      redirect_to "/forums"
    else
      @user = User.new(username: user_params[:username])
      @errors = ["Those credentials don't match anything we have"]
      render :new
    end
  end

  def destroy
    helpers.log_out_user!
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
