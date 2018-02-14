class User < ApplicationRecord
  has_one :profile
  enum role: { member: 0, technical: 1, financial: 2, manager: 3 }
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  before_validation :normalize_email
  has_secure_password

  private

  def normalize_email
    email.downcase!
  end
end
