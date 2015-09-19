json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :shift_id, :employee, :date
  json.url schedule_url(schedule, format: :json)
end
