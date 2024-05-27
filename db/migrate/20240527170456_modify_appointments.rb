class ModifyAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :analysis_date, :date
    remove_column :appointments, :analysis_time, :time
    add_column :appointments, :analysis_datetime, :datetime, null: false
  end
end
