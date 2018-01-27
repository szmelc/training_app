class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform(user)
    RegistrationMailer.welcome_email(user).deliver_now
  end
end
