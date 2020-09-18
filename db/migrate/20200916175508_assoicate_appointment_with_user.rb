class AssoicateAppointmentWithUser < ActiveRecord::Migration[6.0]
  def change
    # add user_id column to appointments with appropriate foreign_key
    add_reference :appointments, :user, foreign_key: true 
  end
end
