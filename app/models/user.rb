class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  validates :profile, length: {maximum: 200}
  validates :name, presence: true,
                    length: {maximum: 20},
                    format: {with: /\A[a-zA-Z]+\z/}
end
