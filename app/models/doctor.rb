class Doctor < ApplicationRecord
  # associations
  has_many :appointments, foreign_key: :doctor_id

  # validations
  validates_presence_of :name, :speciality
end
