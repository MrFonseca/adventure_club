FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dominguez.fonseca+club#{n}@gmail.com"
    end
    password_digest "foobar"
    role :member
  end
end
