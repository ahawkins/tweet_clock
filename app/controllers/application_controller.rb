class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  def authenticate!
    head :unauthorized unless current_user
  end

  def json(obj, arguments = {})
    render arguments.merge(json: obj)
  end

  helper_method :current_user
end
