class ChangeScheduleIdType < ActiveRecord::Migration
  def change
    change_column :schedules, :schedule_id, :integer
  end
end
