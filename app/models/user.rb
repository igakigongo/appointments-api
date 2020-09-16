class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model associations
  has_many :appointments, foreign_key: :user_id

  # validations
  validates_presence_of :email, :name, :password_digest
end
