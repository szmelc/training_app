FactoryBot.define do
  factory :user, aliases: [:admin] do
    name                  'John Smith'
    sequence(:email)      { |n| "exampleuser#{n}@example.com" }
    password              'TestPass'
    country               'Poland'
    bio                   'come to brazil plx'
    phone_number           '666 666 666'

    trait :admin do
      admin               true
    end
  end
end
