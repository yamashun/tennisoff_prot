class CreateOffMeetings < ActiveRecord::Migration
  def change
    create_table :off_meetings do |t|
      t.date :day
      t.string :address
      t.string :level
      t.text :detail

      t.timestamps null: false
    end
  end
end
