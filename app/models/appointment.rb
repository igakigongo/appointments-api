class Appointment < ApplicationRecord
  # validations
  validates_presence_of :doctor_id, :end_date, :reason, :start_date, :user_id
end
