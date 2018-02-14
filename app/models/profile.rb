class Profile < ApplicationRecord
  belongs_to :user
  enum blood_type: [:"O+", :"O-", :"A+", :"A-", :"B+", :"B-", :"AB+", :"AB-"]
  validates :name, presence: true,
                   format: { with: /\A[\D\s]+\z/, message: "apenas letras" }
  validates :cbo, numericality: { only_integer: true },
                  allow_blank: true,
                  uniqueness: true
  validates :document, numericality: { only_integer: true },
                       uniqueness: true
  validates :address, :city, presence: true
  validates :phone_number, uniqueness: true,
                           length: { is: 11 },
                           format: { with: /\A[\d]+\z/ }
end
