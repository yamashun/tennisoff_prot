# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  answer      :text(65535)
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true
end
