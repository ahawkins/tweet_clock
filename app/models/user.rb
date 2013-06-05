require 'digest/sha1'

class User < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :tweets, dependent: :destroy

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.access_token = auth['credentials']['token']
      user.secret_token = auth['credentials']['secret']
    end
  end
end
