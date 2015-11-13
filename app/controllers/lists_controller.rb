class ListsController < ApplicationController
  def index
    if current_user
      @list = List.new
      @lists = List.where(user_id: current_user.id)
    else
      redirect_to login_path
    end
  end
  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to lists_path
    end
  end

  def destroy
    list = List.find_by(id: params[:id])
    list.destroy

    redirect_to lists_path
  end

  def sms
    @list = List.find(params[:id])
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
end