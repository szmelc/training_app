require 'rails_helper'

RSpec.describe DailyPostsCount, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:count) }
  it { should validate_uniqueness_of(:date) }


  it 'cannot be saved twice the same day' do
    2.times do
      DailyPostsCount.create(
        count: 121,
        date: Date.today
      )
      expect(DailyPostsCount.count).to eq(1)
    end
  end
end
