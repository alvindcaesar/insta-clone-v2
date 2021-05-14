class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
          length: { maximum: 255 },
          format: { with: VALID_EMAIL_REGEX },
          uniqueness: { case_sensitive: false }

end
