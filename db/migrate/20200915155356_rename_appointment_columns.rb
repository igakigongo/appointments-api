class RenameAppointmentColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :end, :end_date
    rename_column :appointments, :start, :start_date 
  end
end
