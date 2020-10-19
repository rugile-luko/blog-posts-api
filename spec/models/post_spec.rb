require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  # it 'applies a scope to posts by search parameter q' do
  # end
end