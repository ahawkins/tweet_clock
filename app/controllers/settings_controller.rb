class SettingsController < ApplicationController
  before_filter :authenticate!

  def show
    json settings: current_user.settings
  end

  def update
    current_user.settings = params[:settings]
    current_user.save!

    json settings: current_user.settings
  end
end
