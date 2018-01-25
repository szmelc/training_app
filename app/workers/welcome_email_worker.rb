class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform
    puts 'Email sent!'
    RegistrationMailer.welcome_email.deliver_now
  end
end
