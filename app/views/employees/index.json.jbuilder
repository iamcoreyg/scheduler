json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :position_title, :is_manager, :mon_start, :mon_end, :tues_start, :tues_end, :wed_start, :wed_end, :thurs_start, :thurs_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end
  json.url employee_url(employee, format: :json)
end
