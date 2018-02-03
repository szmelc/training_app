require 'rails_helper'

RSpec.describe Post, type: :model do
  include_context 'users'

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  context 'user_id is missing' do
    let(:post)  { build(:post, user_id: nil) }

    it 'does not save a post' do
      expect{ post.save }.not_to change( user.posts, :count )
    end
  end

  context 'user_id is defined' do
    let(:post)  { build(:post, user: user) }

    it 'saving post increases user counter_cache' do
      expect{ post.save }.to change{ user.posts_count }.by(1)
    end
  end
end
