class AddRangeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :start, :datetime
    add_column :schedules, :end, :datetime
  end
end
