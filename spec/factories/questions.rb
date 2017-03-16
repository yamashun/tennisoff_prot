FactoryGirl.define do
    factory :question do
        question "aaa"
        association :user
        association :off_meeting
    end
end