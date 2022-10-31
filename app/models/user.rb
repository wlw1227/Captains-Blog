class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile
  has_many :articles, -> { order 'published_at DESC, title ASC' }, dependent: :destroy
  has_many :replies, through: :articles, source: :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
