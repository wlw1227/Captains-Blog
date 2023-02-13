require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to an article' do
    expect(Comment.reflect_on_association(:article).macro).to eq(:belongs_to)
  end

  it 'belongs to a user' do
    expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'validates presence of body' do
    comment = Comment.new
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end
end
