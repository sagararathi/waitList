class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  #  User Authentication
  def require_login
    redirect_to root_url unless is_authenticated?
  end

  def is_authenticated?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_session
    if @user
      session[:user_id] = @user.id
    end
  end

  def find_in_errors(obj, str)
    !!(obj.errors.full_messages.join(' ') =~ /#{Regexp.quote(str)}/)
  end

  def send_notification(msg, receiver)
    @client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]
    @client.messages.create(
      from: '+13478365295',
      to: receiver,
      body: msg
    )
  end

  def password_genrator
    Array.new(8){[*'A'..'Z', *'a'..'z',*'1'..'9'].sample }.join
  end
end
