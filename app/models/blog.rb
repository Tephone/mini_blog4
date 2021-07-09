class Blog < ApplicationRecord
  belongs_to :user
  validates :content, presence: true,
                      length: {maximum: 140}
  paginates_per 10
end
