# == Schema Information
#
# Table name: areas
#
#  id             :integer          not null, primary key
#  postal_code    :string(255)      not null
#  prefectural_id :integer
#  city           :string(255)      default("")
#  street         :string(255)      default("")
#

require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
