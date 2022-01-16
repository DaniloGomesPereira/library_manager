FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { SecureRandom.hex(10) }
  end
end
