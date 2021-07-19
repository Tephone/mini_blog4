class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower 
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :profile, length: {maximum: 200}
  validates :name, presence: true,
                    length: {maximum: 20},
                    format:{with: /\A[a-zA-Z]+\z/}
end
