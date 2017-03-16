# == Schema Information
#
# Table name: prefecturals
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Prefectural < ActiveRecord::Base
  has_many :areas
end
