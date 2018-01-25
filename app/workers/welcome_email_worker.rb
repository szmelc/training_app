class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform
    puts 'dupa'
  end
end
