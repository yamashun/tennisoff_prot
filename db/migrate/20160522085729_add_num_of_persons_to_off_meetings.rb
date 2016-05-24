class AddNumOfPersonsToOffMeetings < ActiveRecord::Migration
  def change
    add_column :off_meetings, :num_of_persons, :integer
  end
end
