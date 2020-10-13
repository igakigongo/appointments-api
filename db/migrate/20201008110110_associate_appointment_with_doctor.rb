class AssociateAppointmentWithDoctor < ActiveRecord::Migration[6.0]
  def change
    # add doctor_id column to appointments with appropriate foreign_key
    add_reference :appointments, :doctor, foreign_key: true
  end
end
