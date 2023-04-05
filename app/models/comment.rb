class Comment < ApplicationRecord
  belongs_to :article
  # belongs_to :user

  # validates :user, presence: true
  validates :body, presence: true
  # validates :article_should_be_published

  after_create :email_article_author

  def article_should_be_published
    errors.add(:article_id, 'is not published yet') if article && !article.published?
  end

  def email_article_author
    puts "We will notify #{article.user.email}" if article.user
  end
end
