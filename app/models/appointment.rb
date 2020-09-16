class Appointment < ApplicationRecord
  def exists
    p 'checking if an appointment exists'
    p start_date.to_s
    @result = Appointment.any(start_date: [start_date, start_date + 30.minutes])
    @result
  end

  # validations
  validates_presence_of :end_date, :reason, :start_date
end
