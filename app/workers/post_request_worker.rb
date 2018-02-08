class PostRequestWorker < ApplicationMailer
  include Sidekiq::Worker
  sidekiq_options :retry => 5

  sidekiq_retry_in do |count|
    5
  end

  def perform(post_body, user_id)
    HTTParty.post('http://localhost:9292/api/',
    :query => {
      post_body: post_body,
      user_id: user_id
    })
  end
end
