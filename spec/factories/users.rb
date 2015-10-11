FactoryGirl.define do
  factory :user do
    first_name "First"
    sequence(:email) { |n| "user#{n}@Blocipedia.com" }
    password "pedro19092"
    password_confirmation "pedro19092"

    trait :admin do
    	role 'admin'
    end

  end
end
