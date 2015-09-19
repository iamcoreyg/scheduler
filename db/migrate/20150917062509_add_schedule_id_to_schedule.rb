class AddScheduleIdToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :schedule_id, :float
  end
end
