class Post < ApplicationRecord
  include HTTParty
  default_scope { order(created_at: :desc ) }

  belongs_to :user, counter_cache: true

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  after_create :send_request

  private

  def send_request
    PostRequestWorker.perform_async(id)
  end
end
