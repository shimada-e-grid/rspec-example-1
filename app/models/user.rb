class User < ApplicationRecord
  has_secure_password validations: false

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :password, presence: true, length: { maximum: 10 }
end
