FactoryBot.define do
  factory :profile do
    name "João Villas-Bôas Gonçalves"
    birthday_date "1980-02-14"
    sequence :cbo do |n|
      n
    end
    sequence :document do |n|
      n
    end
    blood_type :"O+"
    address "Rua dos Bobos, número Zero"
    city "Cafundó"
    sequence :phone_number do |n|
      "#{n + 75_999_888_000}"
    end
    user
  end
end
