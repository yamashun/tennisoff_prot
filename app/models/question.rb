class Question < ActiveRecord::Base
  belongs_to :off_meeting
  belongs_to :user
  has_many :answers
end
