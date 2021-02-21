class User < ApplicationRecord
  has_secure_password
  has_many :notes

  validates :first_name, presence: true
  validates :email, format: { with: /\A(.+)@(.+)\z/, message: "is invalid"  }, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }
end
