class User < ApplicationRecord
  has_many :zoos
  has_many :favorite_zoos, dependent: :destroy
  has_many :favorite_animals, dependent: :destroy

  mount_uploader :icon, ImageUploader

  before_validation { email.downcase! }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'admin@example.com') do |user|
      user.name = "ゲスト管理者"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

end
