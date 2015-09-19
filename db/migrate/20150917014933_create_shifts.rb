class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :start
      t.string :end
      t.string :active_days
      t.boolean :manager_only

      t.timestamps null: false
    end
  end
end
