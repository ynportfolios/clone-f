class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :image, presence: true
  validates :content, presence: true

  has_many :favorites, dependent: :destroy
end
