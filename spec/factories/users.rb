FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dominguez.fonseca+club#{n}@gmail.com"
    end
    password "foobar"
    password_confirmation "foobar"
    role :member
    registration_date "2008-03-25"
  end
end
