class ListsController < ApplicationController
  before_filter :set_list, only: [:edit, :update, :destroy, :sms]
  def index
    if current_user
      @list = List.new
      @lists = List.where(user_id: current_user.id)
    else
      redirect_to login_path
    end
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def sms
    message = "#{@list.name}  #{@list.message}"
    send_notification(message, @list.mobile)
    @list.status = true
    if @list.save
      redirect_to lists_path
    end
  end

  private
  def list_params
    params.require(:list).permit(:id,:name, :mobile, :message, :status).merge(user_id: current_user.id)
  end
  def set_list
    @list = List.find_by(id: params[:id])
  end
end