class Article < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :comments

  after_save :set_published_at

  scope :published, -> { where.not(published_at: nil) }
  scope :draft, -> { where(published_at: nil)}
  scope :recent, -> { where('articles.published_at > ?', 1.week.ago.to_date) }
  scope :where_title, ->(term) { where('articles.title LIKE ?', term) }

  def long_title
    "#{title} - #{published_at}"
  end

  #published_at is a DateTime object
  def set_published_at
    self.published_at = DateTime.now if published?
  end

  def published?
    published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a?(User)
    user == owner
  end
end