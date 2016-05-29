class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "250x250#", thumb: "50x50#"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]
  has_many :off_meetings
  has_many :entries
  has_many :questions
  has_many :answers

end
