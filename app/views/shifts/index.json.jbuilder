json.array!(@shifts) do |shift|
  json.extract! shift, :id, :start, :end, :active_days, :manager_only
  json.url shift_url(shift, format: :json)
end
