class AddGeoinfoToOffMeetings < ActiveRecord::Migration
  def change
    add_column :off_meetings, :latitude, :float
    add_column :off_meetings, :longitude, :float
  end
end
