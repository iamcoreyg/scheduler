class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_hours(parameters)
    start_time = parameters[:start_time] ? parameters[:start_time] : 0
    end_time = parameters[:end_time] ? parameters[:end_time] : 24.hours
    increment = parameters[:increment] ? parameters[:increment] : 30.minutes
    Array.new(1 + (end_time - start_time)/increment) do |i|
      (Time.now.midnight + (i*increment) + start_time).strftime("%H:%M")
    end
  end

  def time_to_int(obj)
    unless obj.blank?
      obj.gsub(':', ',').to_i
    end
  end

end
