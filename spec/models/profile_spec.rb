require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'belongs to a user' do
    expect(Profile.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'validates presence of username' do
    profile = Profile.new
    profile.valid?
    expect(profile.errors[:username]).to include("can't be blank")
  end
end
