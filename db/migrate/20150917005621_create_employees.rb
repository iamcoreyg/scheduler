class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position_title
      t.boolean :is_manager
      t.integer :mon_start
      t.integer :mon_end
      t.integer :tues_start
      t.integer :tues_end
      t.integer :wed_start
      t.integer :wed_end
      t.integer :thurs_start
      t.integer :thurs_end
      t.integer :fri_start
      t.integer :fri_end
      t.integer :sat_start
      t.integer :sat_end
      t.integer :sun_start
      t.integer :sun_end

      t.timestamps null: false
    end
  end
end
