class Post < ApplicationRecord
  include HTTParty
  default_scope { order(created_at: :desc ) }

  belongs_to :user, counter_cache: true

  has_many :taggings
  has_many :comments, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :content, presence: true

  after_create :send_request

  def all_tags=(names)
  self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  private

  def send_request
    PostRequestWorker.perform_async(id)
  end
end
