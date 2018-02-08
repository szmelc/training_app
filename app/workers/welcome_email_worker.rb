class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform(email)
    RegistrationMailer.welcome_email(email).deliver_now
  end
end
