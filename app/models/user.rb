class User < ApplicationRecord
  mount_uploader :icon, ImageUploader

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :owner, presence: true
  validates :admin, presence: true

end
