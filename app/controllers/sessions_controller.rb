class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    self.current_user = user
    redirect_to app_path
  end

  def failure
    flash[:failure] = params[:message]
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end
