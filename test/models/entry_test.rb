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

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
