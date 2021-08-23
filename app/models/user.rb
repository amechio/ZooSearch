class User < ApplicationRecord
  has_many :zoos
  has_many :favorite_zoos, dependent: :destroy
  has_many :favorite_animals, dependent: :destroy

  mount_uploader :icon, ImageUploader

  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 30 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

end
