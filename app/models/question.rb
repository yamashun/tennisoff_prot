# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  question       :text(65535)
#  user_id        :integer
#  off_meeting_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :off_meeting
  belongs_to :user
  has_many :answers

  validates :question, presence: true
  validates :user_id, presence: true
  validates :off_meeting_id, presence: true

end
