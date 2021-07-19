class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :user_id, uniquness: {scope: :blog_id}
end
