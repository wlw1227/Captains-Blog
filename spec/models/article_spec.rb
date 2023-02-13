require 'rails_helper'

RSpec.describe Article, type: :model do

  article = Article.new
  error_message = "can't be blank"

  it 'should validate presence of title' do
    article.valid?
    expect(article.errors[:title]).to include(error_message)
  end

  it 'should validate presence of body' do
    article.valid?
    expect(article.errors[:body]).to include(error_message)
  end
end
