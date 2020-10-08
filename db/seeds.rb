require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
doctor_specializations = %w[
  Allergist
  Anesthesiologists
  Cardiologist
  Dermatologist
  Endoctrinologist
  Gastroenterologist
  Nephrologist
  Neurologist
  Obstetrician
  Oncologist
  Ophthalmologist
  Otolaryngologist
  Psychiatrist
  Pulmonologist
  Radiologist
  Rheumatologist
  Urologist
]

doctor_specializations.each do |specialization|
  Doctor.create!(name: Faker::Name.name, speciality: specialization)
end
