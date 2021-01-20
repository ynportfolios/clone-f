class User < ApplicationRecord
  before_validation { email.downcase! }
  
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :pictures, dependent: :destroy

  mount_uploader :user_image, UserImageUploader
end
