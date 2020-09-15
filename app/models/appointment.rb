class Appointment < ApplicationRecord
  # validations
  validates_presence_of :end, :reason, :start
end
