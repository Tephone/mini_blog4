class Blog < ApplicationRecord
  belongs_to :user
  validates :content, presence: true,
                      length: {maximum: 140}
  mount_uploader :image, ImageUploader
end
