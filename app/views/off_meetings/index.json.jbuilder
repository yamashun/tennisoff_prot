json.array!(@off_meetings) do |off_meeting|
  json.extract! off_meeting, :id, :day, :address, :level, :detail
  json.url off_meeting_url(off_meeting, format: :json)
end
