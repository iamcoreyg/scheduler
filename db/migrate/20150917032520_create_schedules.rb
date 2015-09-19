class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :shift_id
      t.string :employee
      t.datetime :date

      t.timestamps null: false
    end
  end
end
