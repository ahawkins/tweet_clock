class ProfileSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :handle
  attributes :location
  attributes :description
  attributes :avatar

  def id
    'me'
  end
end
