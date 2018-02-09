FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dominguez.fonseca+club#{n}@gmail.com"
    end
    # password_digest "foobar"
    password "foobar"
    password_confirmation "foobar"
    role :member
  end
end
