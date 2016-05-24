class AddUserIdToOffMeetings < ActiveRecord::Migration
  def change
    add_column :off_meetings, :user_id, :integer
  end
end
