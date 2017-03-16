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

class OffMeeting < ActiveRecord::Base
  belongs_to :user #オフ会に開催するユーザー
  has_many :entries
  has_many :users, through: :entries #オフ会に参加するユーザー
  has_many :questions, ->{ order("updated_at DESC") }

  ##geogodeを使った経緯度の登録
  geocoded_by :address
  after_validation :geocode

  validates :day, presence: true
  validates :address, presence: true, length: { in: 1..100 }
  validates :level, inclusion: { in: %w(1 2 3 4)}
  validates :detail , length: { maximum: 600 }
  validates :summary, presence: true, length: { in: 1..80 }
  validates :num_of_persons, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :user_id, presence: true


   def level_convert
      db_level_array = %w(1 2 3 4)
      display_level_array = %w(初級 中級 上級 フリー)
      if db_level_array.include?(self.level)
        display_level_array[self.level.to_i-1]
      else
        display_level_array[3]
      end
   end

end
