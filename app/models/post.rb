class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates :title, presence: true
  validates :content, presence: true
end
