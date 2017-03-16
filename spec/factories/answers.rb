FactoryGirl.define do
    factory :answer do
        answer "aaa"
        association :user
        association :question
    end
end