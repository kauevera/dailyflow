class User < ApplicationRecord
  has_secure_password
  has_many :categories, dependent: :destroy
  has_many :tasks, dependent: :destroy
end