class User < ApplicationRecord
  has_one :profile
  enum role: [:"Sócio", :"Diretor Técnico", :Tesoureiro, :Gestor]
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :registration_date, presence: true
  before_validation :normalize_email
  has_secure_password

  private

  def normalize_email
    email.downcase!
  end
end
