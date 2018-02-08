class PostRequestWorker < ApplicationMailer
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(post_body, user_id)
    response = HTTParty.post('http://localhost:9292/api/',
    :query => {
      post_body: post_body,
      user_id: user_id
    })
    fail if response.code != 201
  end
end
