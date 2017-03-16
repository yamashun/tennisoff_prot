FactoryGirl.define do
    factory :entry do
        association :user
        association :off_meeting
    end
end