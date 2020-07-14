class User < ApplicationRecord
  has_many :builds

  has_secure_password
  validates :email, presence: true, uniqueness: true
  # validates :username, length: { maximum: 20 }, presence: true, uniqueness: true
  # validates :password, length: { in: 7..20 }, presence: true
end
