FactoryGirl.define do
  factory :account do
    username { Faker::Internet.user_name }
    password {Faker::Internet.password }
  end
end
