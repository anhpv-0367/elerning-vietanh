class User < ActiveRecord::Base
  validates :name, presence: true, length: { Settings.models.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
  validates :password, length: { Settings.models.minimum }
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  has_secure_password
end
