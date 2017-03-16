FactoryGirl.define do
    factory :user do
        # email  { Faker::Internet.email }
        sequence(:email) { |n| "johndoe#{n}@example.com"}
        password "pass5468"
        password_confirmation "pass5468"
        nickname "testuser"
    end
end