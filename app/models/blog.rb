class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_like, through: :likes, source: :user
  validates :content, presence: true,
                      length: {maximum: 140}
end
