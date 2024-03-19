class ApplicationController < ActionController::Base
  include Pundit::Authorization  
  helper_method :current_user
  helper_method :current_user_admin
  helper_method :authorize_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
      # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
      @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def current_user_admin
    if current_user
      user = User.find_by(id: session[:user_id])
      user.admin
    end
  end

  def authorize_user
    authorize User.new
  end

private
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to new_user_session_path
  end
end
