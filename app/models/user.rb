class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_one :identity, dependent: :destroy

  def self.find_for_oauth(auth, email)
    identity = Identity.find_for_oauth(auth)
    identity.user || identity.create_user!(name: auth.extra.raw_info.name,
                                           email: email,
                                           password: Devise.friendly_token[0,20])
  end
end
