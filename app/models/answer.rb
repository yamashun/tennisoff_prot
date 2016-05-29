class Answer < ActiveRecord::Base
  belongs_to :qestions
  belongs_to :user
end
