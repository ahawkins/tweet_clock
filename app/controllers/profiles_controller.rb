class ProfilesController < ApplicationController
  before_filter :authenticate!

  def show
    expires_in 1.month

    profile = Profile.new current_user.name
    render json: profile
  end
end
