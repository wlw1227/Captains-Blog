class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :email, length: { in: 5..50 }
  validates :email, format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }
  validates :password, confirmation: true

  has_one :profile
  has_many :articles, -> { order 'published_at DESC, title ASC' }, dependent: :destroy
  has_many :replies, through: :articles, source: :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
