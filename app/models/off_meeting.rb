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
  validates :detail , length: { in: 1..600 }
  validates :summary, presence: true, length: { in: 1..80 }
  validates :user_id, presence: true

   def level_convert
      level_arr = ["初級","中級","上級", "フリー"]
      level_arr[self.level.to_i-1]
   end

end