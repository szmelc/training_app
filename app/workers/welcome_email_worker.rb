class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform(user)
    binding.pry
    RegistrationMailer.welcome_email(user).deliver_now
  end
end
