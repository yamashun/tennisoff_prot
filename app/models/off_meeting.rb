class OffMeeting < ActiveRecord::Base
  belongs_to :user #オフ会に開催するユーザー
  has_many :entries
  has_many :users, through: :entries #オフ会に参加するユーザー
  has_many :questions, ->{ order("updated_at DESC") }
end
