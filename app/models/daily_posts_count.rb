class DailyPostsCount < ApplicationRecord
  validates :date, presence: true
  validates :count, presence: true
  validates_uniqueness_of :date
end
