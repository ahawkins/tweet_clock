class Profile
  def initialize(handle)
    @handle = handle
  end

  def name
    user.name
  end

  def handle
    @handle
  end

  def location
    user.location
  end

  def description
    user.description
  end

  def avatar
    user.profile_image_url
  end

  def active_model_serializer
    ProfileSerializer
  end

  def read_attribute_for_serialization(name)
    send name
  end

  private
  def user
    @user ||= Twitter.user @handle
  end
end
