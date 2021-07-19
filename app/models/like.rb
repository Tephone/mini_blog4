class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :blog_id, uniqueness: { scope: :user_id }
end
