class Doctor < ApplicationRecord
  # validations
  validates_presence_of :name, :speciality
end
