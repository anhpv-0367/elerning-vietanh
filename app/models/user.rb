class User < ActiveRecord::Base
  validates :name, presence: true,
    length: {maximum: Settings.models.maximum1}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.models.maximum2},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: Settings.models.minimum}
  has_secure_password

  before_save {self.email = email.downcase}

end
