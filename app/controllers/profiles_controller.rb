class ProfilesController < ApplicationController
  before_filter :authenticate!

  def show
    expires_in 1.year

    profile = Profile.new current_user.name
    json profile
  end
end
