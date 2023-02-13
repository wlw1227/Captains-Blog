require 'rails_helper'

RSpec.describe User, type: :model do

  error_message = "can't be blank"

  it 'validates presence of email' do
    user = User.new
    user.valid?
    expect(user.errors[:email]).to include(error_message)
  end

  it 'validates uniqueness of email' do
    user = User.create(email: 'example@example.com', password: 'password')
    other_user = User.new(email: 'example@example.com', password: 'password')
    other_user.valid?
    expect(other_user.errors[:email]).to include('has already been taken')
  end

  it 'validates presence of password' do
    user = User.new(email: 'example@example.com')
    user.valid?
    expect(user.errors[:password]).to include(error_message)
  end

  it 'has many article' do
    expect(User.reflect_on_association(:articles).macro).to eq(:has_many)
  end
end
