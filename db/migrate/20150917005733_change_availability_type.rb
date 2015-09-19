class ChangeAvailabilityType < ActiveRecord::Migration
  def change
    change_column :employees, :mon_start, :string
    change_column :employees, :mon_end, :string
    change_column :employees, :tues_start, :string
    change_column :employees, :tues_end, :string
    change_column :employees, :wed_start, :string
    change_column :employees, :wed_end, :string
    change_column :employees, :thurs_start, :string
    change_column :employees, :thurs_end, :string
    change_column :employees, :fri_start, :string
    change_column :employees, :fri_end, :string
    change_column :employees, :sat_start, :string
    change_column :employees, :sat_end, :string
    change_column :employees, :sun_start, :string
    change_column :employees, :sun_end, :string
  end
end
