class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model associations
  has_many :appointments, foreign_key: :user_id

  # validations
  validates_presence_of :email, :name, :password_digest
  validates :email,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              message: 'invalid email address'
            },
            uniqueness: { case_sensitive: false }
end
