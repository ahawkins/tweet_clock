class AppController < ApplicationController
  before_filter :user_required!

  def user_required!
    redirect_to root_path unless current_user
  end
end
