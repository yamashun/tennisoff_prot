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

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
