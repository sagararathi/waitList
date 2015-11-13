class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    render :new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_path
    else

      render :new
    end
  end
end