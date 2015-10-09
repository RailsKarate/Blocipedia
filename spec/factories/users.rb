FactoryGirl.define do
  factory :user do
    first_name "First"
    sequence(:email) { |n| "user#{n}@Blocipedia.com" }
    password "pedro19092"
    password_confirmation "pedro19092"

    trait :admin do
    	role 'admin'
    end

    trait :standard do
    	role 'standard'
    end

    trait :premium do
        role 'premium'
    end
  end
end
