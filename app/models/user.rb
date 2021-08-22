class User < ApplicationRecord
  has_many :zoos

  mount_uploader :icon, ImageUploader

  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 30 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :owner, presence: true
  validates :admin, presence: true

  has_secure_password

end
