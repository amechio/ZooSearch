class User < ApplicationRecord
  has_many :zoos
  has_many :favorite_zoos, dependent: :destroy
  has_many :favorite_animals, dependent: :destroy
  has_many :contacts

  mount_uploader :icon, ImageUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :validatable

  before_validation { email.downcase! }

  validates :name, presence: true
  validates :email, uniqueness: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, on: :create


  def self.guest
    find_or_create_by!(email: 'guest@email.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'admin@email.com') do |user|
      user.name = "ゲスト管理者"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end
end

def update_without_current_password(params, *options)
  params.delete(:current_password)

  if params[:password].blank? && params[:password_confirmation].blank?
    params.delete(:password)
    params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
end
