class Appointment < ApplicationRecord
  # validations
  validates_presence_of :end_date, :reason, :start_date
end
