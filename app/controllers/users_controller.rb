class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:new, :create, :password]
  def new
    @user = User.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_session
       UserMailer.welcome_email(@user).deliver
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to lists_path
    end
  end

  def destroy
    if @user == current_user
      @user.destroy
      session.clear
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :firstname, :lastname, :email, :password, :password_confirmation)
  end

end