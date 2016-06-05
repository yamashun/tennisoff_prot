class AddPostalCodeToOffMeetings < ActiveRecord::Migration
  def change
    add_column :off_meetings, :address_postal_code, :string
  end
end
