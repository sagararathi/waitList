class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      set_session
      redirect_to lists_path
    else
      @user = User.new
      render 'new'
    end
  end

  def destroy
      session.clear
      redirect_to root_path
  end
end