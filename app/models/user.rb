class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  enum role: %w(default admin)

  def order?(order_id)
    self == Order.find(order_id).user
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.password           = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.username           = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end
end
