module ApplicationHelper
  def signup_path
    signin_path provider: 'twitter'
  end
end
