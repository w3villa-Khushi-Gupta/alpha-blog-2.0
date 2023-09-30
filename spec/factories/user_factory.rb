require 'faker'

FactoryBot.define do
    factory :user do
      username {  Faker::Name.unique.name }
      email { Faker::Internet.email }
      phone_no { Faker::PhoneNumber.unique.phone_number.gsub(/\D/, '')[0...10] }
      password { 'password' }
    end

  end