# == Schema Information
#
# Table name: entries
#
#  id             :integer          not null, primary key
#  off_meeting_id :integer
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :off_meeting

  validates :user_id, presence: true
  validates :off_meeting_id, presence: true

end
