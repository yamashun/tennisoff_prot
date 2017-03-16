# == Schema Information
#
# Table name: off_meetings
#
#  id                  :integer          not null, primary key
#  day                 :date
#  address             :string(255)
#  level               :string(255)
#  detail              :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  summary             :string(255)
#  num_of_persons      :integer
#  user_id             :integer
#  address_postal_code :string(255)
#  latitude            :float(24)
#  longitude           :float(24)
#

require 'test_helper'

class OffMeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
