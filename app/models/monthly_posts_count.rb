class MonthlyPostsCount < ApplicationRecord
  validates :count, presence: true
  validates :date, presence: true
  validates :month, presence: true
  validates_uniqueness_of :date
end
