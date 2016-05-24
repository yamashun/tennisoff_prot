class AddSummaryToOffMeetings < ActiveRecord::Migration
  def change
    add_column :off_meetings, :summary, :string
  end
end
